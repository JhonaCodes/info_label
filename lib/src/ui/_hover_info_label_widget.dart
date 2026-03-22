part of 'info_label_widget.dart';

/// Adds [MouseRegion] hover behavior around a label.
///
/// Uses [ValueNotifier<Color?>] passed to painters via [super.repaint]
/// so hover state changes trigger only [CustomPainter.paint] —
/// no build, no layout, no widget tree diff.
class _HoverInfoLabel extends StatefulWidget {
  final _InfoLabelData data;
  final double? compactSize;
  final Color? onHoverColor;
  final _OverlayPainter? overlayPainter;

  const _HoverInfoLabel({
    required this.data,
    this.compactSize,
    this.onHoverColor,
    this.overlayPainter,
  });

  @override
  State<_HoverInfoLabel> createState() => _HoverInfoLabelState();
}

class _HoverInfoLabelState extends State<_HoverInfoLabel> {
  final ValueNotifier<Color?> _bgOverride = ValueNotifier<Color?>(null);

  @override
  void dispose() {
    _bgOverride.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final data = widget.data;
    final labelColor = data.typeLabelColor;
    final isCompact = widget.compactSize != null;

    // Compact text-only: full custom paint
    if (isCompact && data.titleWidget == null) {
      return MouseRegion(
        onEnter: (_) => _bgOverride.value = _hoverColor,
        onExit: (_) => _bgOverride.value = null,
        child: Semantics(
          label: data.text,
          child: SizedBox(
            width: widget.compactSize!,
            height: widget.compactSize!,
            child: CustomPaint(
              painter: _CompactTextPainter(
                backgroundColor: labelColor.backgroundColor,
                borderColor: labelColor.borderColor,
                roundedCorners: data.roundedCorners,
                smoothCorners: data.smoothCorners,
                text: data.text ?? '',
                textStyle:
                    data.textStyle ??
                    TextStyle(
                      color: data.globalColor ?? labelColor.textColor,
                      fontSize: widget.compactSize! * 0.55,
                      fontWeight: FontWeight.w600,
                      height: 1.0,
                    ),
                size: widget.compactSize!,
                hoverColor: _bgOverride,
              ),
              foregroundPainter: widget.overlayPainter,
            ),
          ),
        ),
      );
    }

    // Compact with titleWidget: background painter + widget child
    if (isCompact) {
      return MouseRegion(
        onEnter: (_) => _bgOverride.value = _hoverColor,
        onExit: (_) => _bgOverride.value = null,
        child: SizedBox(
          width: widget.compactSize!,
          height: widget.compactSize!,
          child: CustomPaint(
            painter: _InfoLabelBasePainter(
              backgroundColor: labelColor.backgroundColor,
              borderColor: labelColor.borderColor,
              roundedCorners: data.roundedCorners,
              smoothCorners: data.smoothCorners,
              hoverColor: _bgOverride,
            ),
            foregroundPainter: widget.overlayPainter,
            child: Padding(
              padding: EdgeInsets.all(widget.compactSize! * 0.12),
              child: Center(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: data.titleWidget!,
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Base: background painter + _BaseContent child
    return MouseRegion(
      onEnter: (_) => _bgOverride.value = _hoverColor,
      onExit: (_) => _bgOverride.value = null,
      child: CustomPaint(
        painter: _InfoLabelBasePainter(
          backgroundColor: labelColor.backgroundColor,
          borderColor: labelColor.borderColor,
          roundedCorners: data.roundedCorners,
          smoothCorners: data.smoothCorners,
          hoverColor: _bgOverride,
        ),
        foregroundPainter: widget.overlayPainter,
        child: _BaseContent(data: data, labelColor: labelColor),
      ),
    );
  }

  Color? get _hoverColor =>
      widget.onHoverColor ??
      widget.data.globalColor?.withValues(alpha: widget.data.contrastLevel);
}
