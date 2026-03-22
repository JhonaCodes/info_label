part of 'info_label_widget.dart';

// ---------------------------------------------------------------------------
// iOS-style continuous corner radius (squircle)
//
// Based on the Figma smooth corners algorithm. Each corner is drawn
// with 3 cubic bézier segments instead of 1 circular arc, producing
// a gradual transition between the straight edge and the curve.
//
// The `smoothing` parameter (0.0–1.0) controls how much the curve
// departs from a standard circular arc. At 0.0 it matches RRect exactly.
// At 0.6 it matches iOS/Figma default. At 1.0 it's maximum smoothness.
// ---------------------------------------------------------------------------

/// Generates an iOS-style continuous rounded rectangle [Path].
///
/// [smoothing] controls the intensity:
/// - `0.0` = identical to standard circular [RRect]
/// - `0.6` = iOS/Figma default
/// - `1.0` = maximum smoothness
Path _squirclePath(Rect rect, double radius, {double smoothing = 0.6}) {
  // Clamp radius to half the shortest side so corners never overlap.
  final r = radius.clamp(0.0, rect.shortestSide / 2);

  // How far from the corner the curve extends. Clamped uniformly
  // so all 4 corners are identical regardless of rect aspect ratio.
  final maxP = rect.shortestSide / 2;
  final p = ((1 + smoothing) * r).clamp(0.0, maxP);

  // Recompute effective radius from the clamped p so all bézier
  // control points stay proportional and symmetric.
  final er = p / (1 + smoothing);

  // Arc-to-line transition ratios (derived from Figma's algorithm).
  final a = er * 0.292893; // er * (1 - cos(45°))
  final b = er * 0.585786; // er * (1 - cos(45°)) * 2
  final d = (p - er) * smoothing; // smoothing extension

  final l = rect.left;
  final t = rect.top;
  final ri = rect.right;
  final bo = rect.bottom;

  return Path()
    ..moveTo(l + p, t)

    // ── Top edge → Top-right corner ──
    ..lineTo(ri - p, t)
    ..cubicTo(ri - p + d, t, ri - b, t, ri - a, t + a)
    ..cubicTo(ri, t + b, ri, t + p - d, ri, t + p)

    // ── Right edge → Bottom-right corner ──
    ..lineTo(ri, bo - p)
    ..cubicTo(ri, bo - p + d, ri, bo - b, ri - a, bo - a)
    ..cubicTo(ri - b, bo, ri - p + d, bo, ri - p, bo)

    // ── Bottom edge → Bottom-left corner ──
    ..lineTo(l + p, bo)
    ..cubicTo(l + p - d, bo, l + b, bo, l + a, bo - a)
    ..cubicTo(l, bo - b, l, bo - p + d, l, bo - p)

    // ── Left edge → Top-left corner ──
    ..lineTo(l, t + p)
    ..cubicTo(l, t + p - d, l, t + b, l + a, t + a)
    ..cubicTo(l + b, t, l + p - d, t, l + p, t)

    ..close();
}

/// Draws a rounded shape on [canvas] using either squircle or standard
/// [RRect], depending on [smoothCorners].
void _drawShape(
  Canvas canvas,
  Rect rect,
  double radius,
  bool smoothCorners,
  Paint paint,
) {
  if (smoothCorners && radius > 0) {
    canvas.drawPath(_squirclePath(rect, radius), paint);
  } else {
    canvas.drawRRect(
      RRect.fromRectAndRadius(rect, Radius.circular(radius)),
      paint,
    );
  }
}

// ---------------------------------------------------------------------------
// Painters
// ---------------------------------------------------------------------------

/// Paints a rounded rectangle background with optional border.
///
/// Shared by [_BaseInfoLabel], [_CompactInfoLabel] (titleWidget path),
/// and [_HoverInfoLabel]. When [hoverColor] is provided, it is passed
/// to [super.repaint] so hover state changes trigger only [paint] —
/// no build, no layout.
class _InfoLabelBasePainter extends CustomPainter {
  final Color backgroundColor;
  final Color? borderColor;
  final double roundedCorners;
  final bool smoothCorners;
  final ValueNotifier<Color?>? hoverColor;

  final Paint _bgPaint = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;
  final Paint _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0
    ..isAntiAlias = true;

  _InfoLabelBasePainter({
    required this.backgroundColor,
    this.borderColor,
    required this.roundedCorners,
    this.smoothCorners = false,
    this.hoverColor,
  }) : super(repaint: hoverColor);

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;

    _bgPaint.color = hoverColor?.value ?? backgroundColor;
    _drawShape(canvas, rect, roundedCorners, smoothCorners, _bgPaint);

    final effectiveBorder = borderColor ?? Colors.transparent;
    if (effectiveBorder != Colors.transparent) {
      _borderPaint.color = effectiveBorder;
      _drawShape(
        canvas,
        rect.deflate(0.5),
        roundedCorners,
        smoothCorners,
        _borderPaint,
      );
    }
  }

  /// Determines if the decoration (fill color, border, shape) changed.
  ///
  /// Hover color changes do NOT trigger this — they are handled by the
  /// [ValueNotifier] passed to [super.repaint], which calls [paint]
  /// directly without going through [shouldRepaint].
  @override
  bool shouldRepaint(covariant _InfoLabelBasePainter old) =>
      _decorationChanged(old);

  /// Returns `true` if any visual property of the decoration differs.
  bool _decorationChanged(_InfoLabelBasePainter old) =>
      backgroundColor != old.backgroundColor ||
      borderColor != old.borderColor ||
      roundedCorners != old.roundedCorners ||
      smoothCorners != old.smoothCorners;
}

/// Paints a fixed-size label with rounded background, border,
/// and centered auto-scaled text.
///
/// Replaces the 6-widget tree (`SizedBox → DecoratedBox → Padding →
/// Center → FittedBox → Text`) with a single [RenderCustomPaint].
///
/// Text scaling mimics [FittedBox] with [BoxFit.scaleDown] via
/// [canvas.scale] when text exceeds the available padded area.
class _CompactTextPainter extends CustomPainter {
  final Color backgroundColor;
  final Color? borderColor;
  final double roundedCorners;
  final bool smoothCorners;
  final String text;
  final TextStyle textStyle;
  final double size;
  final ValueNotifier<Color?>? hoverColor;

  final Paint _bgPaint = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;
  final Paint _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0
    ..isAntiAlias = true;

  TextPainter? _tp;

  _CompactTextPainter({
    required this.backgroundColor,
    this.borderColor,
    required this.roundedCorners,
    this.smoothCorners = false,
    required this.text,
    required this.textStyle,
    required this.size,
    this.hoverColor,
  }) : super(repaint: hoverColor);

  @override
  void paint(Canvas canvas, Size canvasSize) {
    final rect = Offset.zero & canvasSize;

    // Background
    _bgPaint.color = hoverColor?.value ?? backgroundColor;
    _drawShape(canvas, rect, roundedCorners, smoothCorners, _bgPaint);

    // Border
    final effectiveBorder = borderColor ?? Colors.transparent;
    if (effectiveBorder != Colors.transparent) {
      _borderPaint.color = effectiveBorder;
      _drawShape(
        canvas,
        rect.deflate(0.5),
        roundedCorners,
        smoothCorners,
        _borderPaint,
      );
    }

    // Text
    _tp ??= TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
      maxLines: 1,
    );
    _tp!.layout();

    final padding = size * 0.12;
    final availW = canvasSize.width - padding * 2;
    final availH = canvasSize.height - padding * 2;

    final scaleX = _tp!.width > 0 ? availW / _tp!.width : 1.0;
    final scaleY = _tp!.height > 0 ? availH / _tp!.height : 1.0;
    final scale = (scaleX < 1.0 || scaleY < 1.0)
        ? (scaleX < scaleY ? scaleX : scaleY)
        : 1.0;

    final textW = _tp!.width * scale;
    final textH = _tp!.height * scale;
    final dx = (canvasSize.width - textW) / 2;
    final dy = (canvasSize.height - textH) / 2;

    canvas.save();
    canvas.translate(dx, dy);
    canvas.scale(scale, scale);
    _tp!.paint(canvas, Offset.zero);
    canvas.restore();
  }

  /// Determines if the label needs to be repainted.
  ///
  /// Checks two independent concerns:
  /// - **Decoration**: background color, border, corner radius, shape changed.
  /// - **Content**: text string, style, or box size changed
  ///   (invalidates TextPainter cache and scale calculations).
  ///
  /// Hover color is NOT checked here — it repaints via the
  /// [ValueNotifier] passed to [super.repaint].
  @override
  bool shouldRepaint(covariant _CompactTextPainter old) =>
      _decorationChanged(old) || _contentChanged(old);

  /// Returns `true` if the visual decoration (fill, border, shape) differs.
  bool _decorationChanged(_CompactTextPainter old) =>
      backgroundColor != old.backgroundColor ||
      borderColor != old.borderColor ||
      roundedCorners != old.roundedCorners ||
      smoothCorners != old.smoothCorners;

  /// Returns `true` if the text content or its layout constraints changed.
  ///
  /// When this returns `true`, the cached [TextPainter] is invalidated
  /// and text metrics are recalculated on the next [paint] call.
  bool _contentChanged(_CompactTextPainter old) =>
      text != old.text || textStyle != old.textStyle || size != old.size;
}

/// Paints a positioned overlay indicator on top of the label.
///
/// Supports 4 modes based on which params are set:
/// - **Dot**: `overlayColor` only → solid circle, no text.
/// - **Badge**: `overlayColor` + `overlayText` → circle/pill with centered text.
/// - **Text only**: `overlayText` without `overlayColor` → just the number/text.
/// - **Badge with border**: add `borderColor` for a bordered indicator.
///
/// For multi-character text (e.g. "99+"), the shape automatically
/// expands from a circle to a rounded pill to fit the content.
///
/// Used as [CustomPaint.foregroundPainter] — zero extra widgets.
class _OverlayPainter extends CustomPainter {
  final Color? color;
  final Color? borderColor;
  final double overlaySize;
  final String? text;

  /// Fully resolved text style including fontFamily.
  /// Built outside the painter (in widget build) so it inherits
  /// the correct font from the theme/context.
  final TextStyle? textStyle;

  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  final Paint _fillPaint = Paint()
    ..style = PaintingStyle.fill
    ..isAntiAlias = true;
  final Paint _borderPaint = Paint()
    ..style = PaintingStyle.stroke
    ..strokeWidth = 1.0
    ..isAntiAlias = true;
  TextPainter? _tp;

  _OverlayPainter({
    this.color,
    this.borderColor,
    required this.overlaySize,
    this.text,
    this.textStyle,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final halfH = overlaySize / 2;

    // ── Position: anchor point (center of the overlay) ──
    double cx = 0;
    double cy = 0;
    if (right != null) {
      cx = size.width - right! - halfH;
    } else if (left != null) {
      cx = left! + halfH;
    }
    if (top != null) {
      cy = top! + halfH;
    } else if (bottom != null) {
      cy = size.height - bottom! - halfH;
    }

    // ── Measure text (if any) to determine shape width ──
    double shapeW = overlaySize;
    if (text != null && text!.isNotEmpty && textStyle != null) {
      _tp ??= TextPainter(
        text: TextSpan(text: text, style: textStyle),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      );
      _tp!.layout();

      // Expand width to fit text + horizontal padding when text is wide.
      final textPad = overlaySize * 0.4;
      if (_tp!.width + textPad > overlaySize) {
        shapeW = _tp!.width + textPad;
      }
    }

    // ── Shape rect centered on (cx, cy) ──
    final shapeRect = Rect.fromCenter(
      center: Offset(cx, cy),
      width: shapeW,
      height: overlaySize,
    );
    final rrect = RRect.fromRectAndRadius(
      shapeRect,
      Radius.circular(halfH),
    );

    // ── Fill background (dot or badge) ──
    if (color != null) {
      _fillPaint.color = color!;
      canvas.drawRRect(rrect, _fillPaint);
    }

    // ── Border ──
    if (borderColor != null) {
      _borderPaint.color = borderColor!;
      canvas.drawRRect(rrect.deflate(0.5), _borderPaint);
    }

    // ── Text centered inside the shape ──
    if (_tp != null) {
      final textDx = cx - _tp!.width / 2;
      final textDy = cy - _tp!.height / 2;
      _tp!.paint(canvas, Offset(textDx, textDy));
    }
  }

  /// Determines if the overlay needs to be repainted.
  ///
  /// Checks two independent concerns:
  /// - **Appearance**: fill, border, size, or text content changed.
  /// - **Position**: the overlay moved to a different location.
  @override
  bool shouldRepaint(covariant _OverlayPainter old) =>
      _appearanceChanged(old) || _positionChanged(old);

  /// Returns `true` if the visual appearance of the indicator differs.
  bool _appearanceChanged(_OverlayPainter old) =>
      color != old.color ||
      borderColor != old.borderColor ||
      overlaySize != old.overlaySize ||
      text != old.text ||
      textStyle != old.textStyle;

  /// Returns `true` if the indicator moved to a different position.
  bool _positionChanged(_OverlayPainter old) =>
      top != old.top ||
      right != old.right ||
      bottom != old.bottom ||
      left != old.left;
}
