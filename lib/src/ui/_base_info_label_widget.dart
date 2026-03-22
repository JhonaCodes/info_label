part of 'info_label_widget.dart';

/// Content layout for the standard label (no decoration).
///
/// Extracted so [_HoverInfoLabel] can preserve this subtree across
/// hover state changes without rebuilding it.
class _BaseContent extends StatelessWidget {
  final _InfoLabelData data;
  final DistributionColor labelColor;

  const _BaseContent({
    required this.data,
    required this.labelColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Flex(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              data.mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment:
              data.crossAxisAlignment ?? CrossAxisAlignment.center,
          direction: Axis.horizontal,
          children: [
            if (data.leftIcon != null)
              Padding(
                padding:
                    data.leftIconPadding ??
                    const EdgeInsets.only(
                      left: 1.75,
                      bottom: 1.75,
                      top: 1.75,
                    ),
                child: data.leftIcon!,
              ),
            const SizedBox(width: 1.75),
            Flexible(
              flex: 1,
              fit: data.isTextAdaptive ? FlexFit.loose : FlexFit.tight,
              child: Padding(
                padding:
                    data.textPadding ??
                    const EdgeInsets.only(left: 1.75, right: 1.75),
                child:
                    (data.msg != null &&
                            (data.text == null && data.titleWidget == null))
                        ? data.msg!
                        : data.titleWidget ??
                              Text(
                                data.text!,
                                style:
                                    data.textStyle ??
                                    TextStyle(
                                      color:
                                          data.globalColor ??
                                          labelColor.textColor,
                                      fontSize: data.fontSize,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
              ),
            ),
            const SizedBox(width: 1.75),
            if (data.rightIcon != null)
              Padding(
                padding:
                    data.rightIconPadding ??
                    const EdgeInsets.only(
                      right: 1.75,
                      bottom: 1.75,
                      top: 1.75,
                    ),
                child: data.rightIcon!,
              ),
          ],
        ),
        if (data.msg != null &&
            (data.text != null || data.titleWidget != null))
          Padding(
            padding:
                data.msgPadding ??
                const EdgeInsets.only(left: 5, right: 5, bottom: 5),
            child: data.msg!,
          ),
      ],
    );
  }
}

/// Base label widget using [CustomPaint] for background and border.
///
/// Uses [_InfoLabelBasePainter] as [CustomPaint.painter] and
/// [_BaseContent] as [CustomPaint.child]. Overlay indicator is
/// painted via [CustomPaint.foregroundPainter].
class _BaseInfoLabel extends StatelessWidget {
  final _InfoLabelData data;
  final _OverlayPainter? overlayPainter;

  const _BaseInfoLabel({
    required this.data,
    this.overlayPainter,
  });

  @override
  Widget build(BuildContext context) {
    final labelColor = data.typeLabelColor;

    return CustomPaint(
      painter: _InfoLabelBasePainter(
        backgroundColor: labelColor.backgroundColor,
        borderColor: labelColor.borderColor,
        roundedCorners: data.roundedCorners,
        smoothCorners: data.smoothCorners,
      ),
      foregroundPainter: overlayPainter,
      child: _BaseContent(data: data, labelColor: labelColor),
    );
  }
}
