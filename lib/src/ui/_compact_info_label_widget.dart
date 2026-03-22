part of 'info_label_widget.dart';

/// Fixed-size square label with centered, auto-scaled content.
///
/// When `data.titleWidget == null`, uses [_CompactTextPainter] for
/// full custom paint (1 RenderObject). Otherwise falls back to
/// [_InfoLabelBasePainter] with widget child for the titleWidget.
class _CompactInfoLabel extends StatelessWidget {
  final _InfoLabelData data;
  final double size;
  final _OverlayPainter? overlayPainter;

  const _CompactInfoLabel({
    required this.data,
    required this.size,
    this.overlayPainter,
  });

  @override
  Widget build(BuildContext context) {
    final labelColor = data.typeLabelColor;

    if (data.titleWidget != null) {
      return SizedBox(
        width: size,
        height: size,
        child: CustomPaint(
          painter: _InfoLabelBasePainter(
            backgroundColor: labelColor.backgroundColor,
            borderColor: labelColor.borderColor,
            roundedCorners: data.roundedCorners,
            smoothCorners: data.smoothCorners,
          ),
          foregroundPainter: overlayPainter,
          child: Padding(
            padding: EdgeInsets.all(size * 0.12),
            child: Center(
              child: FittedBox(fit: BoxFit.scaleDown, child: data.titleWidget!),
            ),
          ),
        ),
      );
    }

    return Semantics(
      label: data.text,
      child: SizedBox(
        width: size,
        height: size,
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
                  fontSize: size * 0.55,
                  fontWeight: FontWeight.w600,
                  height: 1.0,
                ),
            size: size,
          ),
          foregroundPainter: overlayPainter,
        ),
      ),
    );
  }
}
