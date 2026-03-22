part of 'info_label_widget.dart';

/// Encapsulates all shared visual properties for label variants.
///
/// This class avoids repeating the same parameters across
/// [_BaseInfoLabel], [_HoverInfoLabel], and [_OverlayInfoLabel].
class _InfoLabelData {
  final String? text;
  final Widget? titleWidget;
  final Color? textColor;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? globalColor;
  final TextStyle? textStyle;
  final double? fontSize;
  final double contrastLevel;
  final double roundedCorners;
  final bool smoothCorners;
  final Widget? rightIcon;
  final Widget? leftIcon;
  final TypeDistributionColor typeColor;
  final TypeInfoLabel typeInfoLabel;
  final MainAxisAlignment? mainAxisAlignment;
  final CrossAxisAlignment? crossAxisAlignment;
  final EdgeInsetsGeometry? leftIconPadding;
  final EdgeInsetsGeometry? rightIconPadding;
  final EdgeInsetsGeometry? textPadding;
  final Widget? msg;
  final EdgeInsets? msgPadding;
  final bool isTextAdaptive;

  const _InfoLabelData({
    this.text,
    this.titleWidget,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
    this.globalColor,
    this.textStyle,
    this.fontSize,
    this.contrastLevel = 0.3,
    this.roundedCorners = 3.0,
    this.smoothCorners = false,
    this.rightIcon,
    this.leftIcon,
    this.typeColor = TypeDistributionColor.solidTextContrastBackgroundBorder,
    this.typeInfoLabel = TypeInfoLabel.none,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.leftIconPadding,
    this.rightIconPadding,
    this.textPadding,
    this.msg,
    this.msgPadding,
    this.isTextAdaptive = true,
  });

  /// Gets the color of the label based on the distribution type.
  DistributionColor get typeLabelColor {
    final DistributionColor distributionColor = globalColor != null
        ? DistributionColor(
            textColor: globalColor!,
            contrastLevel: contrastLevel,
            borderColor: globalColor!,
            backgroundColor: globalColor!,
          )
        : DistributionColor(
            textColor: textColor,
            contrastLevel: contrastLevel,
            borderColor: borderColor ?? colorType,
            backgroundColor: backgroundColor ?? colorType,
          );
    return distributionColor.labelInfoColors(typeColor: typeColor);
  }

  /// Gets the color based on the label type.
  Color get colorType => _ColorByTypeInfo.get(typeInfoLabel);
}
