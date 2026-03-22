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
  final w = rect.width;
  final h = rect.height;
  final r = radius.clamp(0.0, rect.shortestSide / 2);

  // The smoothing factor determines how far the curve extends
  // beyond the circular arc region.
  final p = (1 + smoothing) * r;

  // Clamp p so the curve doesn't exceed half the side length.
  final px = p.clamp(0.0, w / 2);
  final py = p.clamp(0.0, h / 2);

  // Arc-to-line transition ratios (derived from Figma's algorithm).
  // These control the 3 bézier segments per corner.
  final a = r * 0.292893; // r * (1 - cos(45°)) ≈ r * 0.2929
  final b = r * 0.585786; // r * (1 - cos(45°)) * 2
  final d = (p - r) * smoothing; // extra extension from smoothing

  final l = rect.left;
  final t = rect.top;
  final ri = rect.right;
  final bo = rect.bottom;

  return Path()
    ..moveTo(l + px, t)

    // ── Top edge → Top-right corner (3 curves) ──
    ..lineTo(ri - px, t)
    ..cubicTo(ri - px + d, t, ri - b, t, ri - a, t + a)
    ..cubicTo(ri, t + b, ri, t + py - d, ri, t + py)

    // ── Right edge → Bottom-right corner (3 curves) ──
    ..lineTo(ri, bo - py)
    ..cubicTo(ri, bo - py + d, ri, bo - b, ri - a, bo - a)
    ..cubicTo(ri - b, bo, ri - px + d, bo, ri - px, bo)

    // ── Bottom edge → Bottom-left corner (3 curves) ──
    ..lineTo(l + px, bo)
    ..cubicTo(l + px - d, bo, l + b, bo, l + a, bo - a)
    ..cubicTo(l, bo - b, l, bo - py + d, l, bo - py)

    // ── Left edge → Top-left corner (3 curves) ──
    ..lineTo(l, t + py)
    ..cubicTo(l, t + py - d, l, t + b, l + a, t + a)
    ..cubicTo(l + b, t, l + px - d, t, l + px, t)

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

/// Paints a positioned circle indicator with optional centered text.
///
/// Used as [CustomPaint.foregroundPainter] to draw on top of the label
/// content. Replaces [Stack] + [Positioned] with zero extra widgets.
///
/// Position is computed relative to the parent [Size] using
/// [top], [right], [bottom], [left]. The circle can extend beyond
/// parent bounds (no clipping).
class _OverlayPainter extends CustomPainter {
  final Color color;
  final double overlaySize;
  final String? text;
  final Color? textColor;
  final double? top;
  final double? right;
  final double? bottom;
  final double? left;

  final Paint _circlePaint = Paint()..style = PaintingStyle.fill;
  TextPainter? _tp;

  _OverlayPainter({
    required this.color,
    required this.overlaySize,
    this.text,
    this.textColor,
    this.top,
    this.right,
    this.bottom,
    this.left,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final radius = overlaySize / 2;

    // Compute center position relative to parent bounds.
    // Priority: right > left for horizontal, top > bottom for vertical.
    double cx = 0;
    double cy = 0;

    if (right != null) {
      cx = size.width - right! - radius;
    } else if (left != null) {
      cx = left! + radius;
    }

    if (top != null) {
      cy = top! + radius;
    } else if (bottom != null) {
      cy = size.height - bottom! - radius;
    }

    // Circle indicator
    _circlePaint.color = color;
    canvas.drawCircle(Offset(cx, cy), radius, _circlePaint);

    // Optional text centered inside the circle
    if (text != null && text!.isNotEmpty) {
      _tp ??= TextPainter(
        text: TextSpan(
          text: text,
          style: TextStyle(
            color: textColor ?? Colors.white,
            fontSize: overlaySize * 0.6,
            fontWeight: FontWeight.w600,
            height: 1.0,
          ),
        ),
        textDirection: TextDirection.ltr,
        maxLines: 1,
      );
      _tp!.layout();

      final textDx = cx - _tp!.width / 2;
      final textDy = cy - _tp!.height / 2;
      _tp!.paint(canvas, Offset(textDx, textDy));
    }
  }

  /// Determines if the overlay indicator needs to be repainted.
  ///
  /// Checks two independent concerns:
  /// - **Appearance**: circle color, size, or text content changed.
  /// - **Position**: the overlay moved to a different location.
  @override
  bool shouldRepaint(covariant _OverlayPainter old) =>
      _appearanceChanged(old) || _positionChanged(old);

  /// Returns `true` if the visual appearance of the indicator differs.
  ///
  /// Covers the circle fill color, diameter, and the text/number
  /// displayed inside it.
  bool _appearanceChanged(_OverlayPainter old) =>
      color != old.color ||
      overlaySize != old.overlaySize ||
      text != old.text ||
      textColor != old.textColor;

  /// Returns `true` if the indicator moved to a different position
  /// relative to the parent label bounds.
  bool _positionChanged(_OverlayPainter old) =>
      top != old.top ||
      right != old.right ||
      bottom != old.bottom ||
      left != old.left;
}
