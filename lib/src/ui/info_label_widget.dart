import 'package:flutter/material.dart';

import 'package:info_label/src/core/distribution_color.dart';
import 'package:info_label/src/core/type_color.dart';
import 'package:info_label/src/core/type_info_label.dart';

/// Widget that displays customizable information with label styling.
///
/// This widget allows displaying text with optional icons on the left or right side.
/// Text color, border color, background color, and icon color are all customizable.
/// Additionally, you can configure color distribution, contrast level, font size, and corner radius of the label.
///
/// Example Basic Usage:
/// ```dart
/// InfoLabel(
///  text: "Success",
///   typeInfoLabel: TypeInfoLabel.success,
/// )
/// ```
class InfoLabel extends StatefulWidget {
  /// The text to be displayed on the label.
  final String text;

  /// Text color.
  final Color? textColor;

  /// Border color.
  final Color? borderColor;

  /// Background color.
  final Color? backgroundColor;

  /// Color when hovering over the label.
  final Color? onHoverColor;

  /// Global color that affects all colors if active.
  final Color? globalColor;

  /// Text style.
  final TextStyle? textStyle;

  /// Font size of the text.
  ///
  /// If [textStyle] is provided, this value will be ignored.
  final double? fontSize;

  /// Contrast level of the background color.
  final double contrastLevel;

  /// Corner radius of the label.
  ///
  /// Default value is 5.0.
  final double roundedCorners;

  /// Optional icon on the right side of the label.
  final Icon? rightIcon;

  /// Optional icon on the left side of the label.
  final Icon? leftIcon;

  /// Indicates whether hover functionality is enabled.
  final bool activeOnHover;

  /// Distribution of colors for the label appearance.
  final TypeDistributionColor typeColor;

  /// Type of label defining default colors for a specific appearance.
  final TypeInfoLabel typeInfoLabel;

  /// Alignment for content
  final MainAxisAlignment? mainAxisAlignment;

  final CrossAxisAlignment? crossAxisAlignment;

  final EdgeInsetsGeometry? leftIconPadding;

  final EdgeInsetsGeometry? rightIconPadding;

  final EdgeInsetsGeometry? textPadding;

  /// Creates a new instance of [InfoLabel].
  const InfoLabel({
    super.key,
    required this.text,
    this.mainAxisAlignment,
    this.crossAxisAlignment,
    this.contrastLevel = 0.3,
    this.leftIconPadding,
    this.rightIconPadding,
    this.textPadding,
    this.textColor,
    this.borderColor,
    this.backgroundColor,
    this.onHoverColor,
    this.globalColor,
    this.textStyle,
    this.fontSize,
    this.roundedCorners = 5.0,
    this.rightIcon,
    this.leftIcon,
    this.activeOnHover = true,
    this.typeColor = TypeDistributionColor.solidTextContrastBackgroundBorder,
    this.typeInfoLabel = TypeInfoLabel.none,
  });

  @override
  State<InfoLabel> createState() => _InfoLabelState();
}

class _InfoLabelState extends State<InfoLabel> {
  /// Indicates if the mouse is over the label.
  bool _isHovered = false;

  @override
  void initState() {
    /// Set default colors if textStyle and textColor are provided.
    if (widget.textStyle != null && widget.textColor != null) {
      widget.textStyle?.copyWith(color: widget.textColor);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onHoverAction,
      onExit: _onHoverAction,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.roundedCorners),
          color: _colorOnHover,
          border: Border.all(
              color: _typeLabelColor.borderColor ?? Colors.transparent),
        ),
        child: Flex(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment:
              widget.mainAxisAlignment ?? MainAxisAlignment.center,
          crossAxisAlignment:
              widget.crossAxisAlignment ?? CrossAxisAlignment.start,
          direction: Axis.horizontal,
          children: [
            if (widget.leftIcon != null)
              Padding(
                padding: widget.leftIconPadding ??
                    const EdgeInsets.only(top: 3.0, left: 3.0),
                child: widget.leftIcon!,
              ),
            const SizedBox(
              width: 2,
            ),
            Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Padding(
                padding: widget.textPadding ?? const EdgeInsets.all(1.75),
                child: Text(
                  widget.text,
                  style: widget.textStyle ??
                      TextStyle(
                        color: widget.globalColor ?? _typeLabelColor.textColor,
                        fontSize: widget.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                ),
              ),
            ),
            const SizedBox(
              width: 2,
            ),
            if (widget.rightIcon != null)
              Padding(
                padding: widget.rightIconPadding ??
                    const EdgeInsets.only(top: 3.0, right: 3.0),
                child: widget.rightIcon!,
              ),
          ],
        ),
      ),
    );
  }

  /// Gets the color of the label based on the distribution type.
  DistributionColor get _typeLabelColor {
    final DistributionColor distributionColor = widget.globalColor != null
        ? DistributionColor(
            textColor: widget.globalColor!,
            contrastLevel: widget.contrastLevel,
            borderColor: widget.globalColor!,
            backgroundColor: widget.globalColor!,
          )
        : DistributionColor(
            textColor: widget.textColor,
            contrastLevel: widget.contrastLevel,
            borderColor: widget.borderColor ?? _colorType,
            backgroundColor: widget.backgroundColor ?? _colorType,
          );
    return distributionColor.labelInfoColors(typeColor: widget.typeColor);
  }

  /// Gets the color based on the label type.
  Color get _colorType => _ColorByTypeInfo.get(widget.typeInfoLabel);

  /// Validate if is onHover
  _onHoverAction(_) =>
      widget.activeOnHover ? setState(() => _isHovered = !_isHovered) : null;

  /// Return color for onHover
  Color? get _colorOnHover {
    if (_isHovered) {
      return widget.onHoverColor ??
          widget.globalColor?.withOpacity(widget.contrastLevel);
    }

    return _typeLabelColor.backgroundColor;
  }
}

/// Provides static methods to retrieve colors based on TypeInfoLabel.
///
/// This mixin contains a static method `get` which returns a Color based on the provided TypeInfoLabel.
///
/// Example Usage:
/// ```dart
/// final successColor = _ColorByTypeInfo.get(TypeInfoLabel.success); // Returns Color(0xFF2ecc71)
/// ```
mixin _ColorByTypeInfo {
  /// Returns a Color based on the provided TypeInfoLabel.
  ///
  /// If the provided TypeInfoLabel is not recognized, it returns a default color (Color(0xFFA8A8A8)).
  static Color get(TypeInfoLabel type) => switch (type) {
        TypeInfoLabel.success => const Color(0xff00501F),
        TypeInfoLabel.error => const Color(0xFFe74c3c),
        TypeInfoLabel.neutral => const Color(0xFF284b63),
        TypeInfoLabel.warning => const Color(0xFFf39c12),
        TypeInfoLabel.empty => const Color(0xFFdddddd),
        TypeInfoLabel.dark => const Color(0xFF000814),
        TypeInfoLabel.info => const Color(0xFF3498db),
        TypeInfoLabel.pending => const Color(0xFFf1c40f),
        TypeInfoLabel.confirmed => const Color(0xFF40E0D0),
        TypeInfoLabel.expired => const Color(0xFF663300),
        TypeInfoLabel.disabled => const Color(0xFF8d99ae),
        TypeInfoLabel.critical => const Color(0xFF660708),
        TypeInfoLabel.none => const Color(0xFFA8A8A8),
      };
}
