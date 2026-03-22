import 'package:flutter/material.dart';

import 'package:info_label/src/core/distribution_color.dart';
import 'package:info_label/src/core/type_color.dart';
import 'package:info_label/src/core/type_info_label.dart';

part '_info_label_data.dart';
part '_info_label_painters.dart';
part '_base_info_label_widget.dart';
part '_hover_info_label_widget.dart';
part '_compact_info_label_widget.dart';
part '_color_by_type_info_widget.dart';

/// Widget that displays customizable information with label styling.
///
/// All rendering uses [CustomPainter] as the base — background, border,
/// text (in compact mode), and overlay indicators are painted directly
/// on canvas for minimal RenderObject count.
///
/// Features are composable and independent:
///
/// - **compact**: Set [compactSize] for a fixed `size × size` label
///   with auto-scaled centered content.
/// - **overlay**: Set [overlayColor] to paint a positioned circle indicator
///   on top of the label (with optional [overlayText]).
/// - **hover**: Set [activeOnHover] to `true` for paint-only hover repaint
///   via [MouseRegion] (no widget rebuild).
///
/// ```dart
/// // Compact + overlay + hover
/// InfoLabel(
///   text: "S",
///   compactSize: 24,
///   overlayColor: Colors.red,
///   overlaySize: 8,
///   activeOnHover: true,
///   typeInfoLabel: TypeInfoLabel.info,
/// )
/// ```
class InfoLabel extends StatelessWidget {
  /// The text to be displayed on the label.
  final String? text;

  final Widget? titleWidget;

  /// Text color.
  final Color? textColor;

  /// Border color.
  final Color? borderColor;

  /// Background color.
  final Color? backgroundColor;

  /// Color when hovering over the label.
  ///
  /// Only used when [activeOnHover] is `true`.
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
  /// Default value is 3.0.
  final double roundedCorners;

  /// Uses iOS-style continuous corner radius (squircle) instead of
  /// standard circular arcs.
  ///
  /// When `true`, corners transition smoothly into straight edges
  /// using cubic bézier curves, matching the visual style of iOS
  /// rounded rectangles.
  final bool smoothCorners;

  /// Optional icon on the right side of the label.
  final Widget? rightIcon;

  /// Optional icon on the left side of the label.
  final Widget? leftIcon;

  /// Indicates whether hover functionality is enabled.
  final bool activeOnHover;

  /// Distribution of colors for the label appearance.
  final TypeDistributionColor typeColor;

  /// Type of label defining default colors for a specific appearance.
  final TypeInfoLabel typeInfoLabel;

  /// Alignment for content.
  final MainAxisAlignment? mainAxisAlignment;

  final CrossAxisAlignment? crossAxisAlignment;

  final EdgeInsetsGeometry? leftIconPadding;

  final EdgeInsetsGeometry? rightIconPadding;

  final EdgeInsetsGeometry? textPadding;

  final Widget? msg;

  final EdgeInsets? msgPadding;

  final bool isTextAdaptive;

  /// Overlay indicator circle color.
  ///
  /// When non-null, a circle is painted on top of the label
  /// at [overlayTop], [overlayRight], [overlayBottom], [overlayLeft].
  final Color? overlayColor;

  /// Overlay indicator circle diameter.
  final double overlaySize;

  /// Text/number inside the overlay circle.
  final String? overlayText;

  /// Text color inside the overlay circle.
  final Color? overlayTextColor;

  /// Overlay position from the top edge.
  final double? overlayTop;

  /// Overlay position from the right edge.
  final double? overlayRight;

  /// Overlay position from the bottom edge.
  final double? overlayBottom;

  /// Overlay position from the left edge.
  final double? overlayLeft;

  /// When non-null, uses a fixed `compactSize × compactSize` layout
  /// with auto-scaled centered content instead of the standard layout.
  final double? compactSize;

  /// Creates a new instance of [InfoLabel].
  const InfoLabel({
    super.key,
    this.text,
    this.titleWidget,
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
    this.roundedCorners = 3.0,
    this.smoothCorners = false,
    this.rightIcon,
    this.leftIcon,
    this.activeOnHover = false,
    this.typeColor = TypeDistributionColor.solidTextContrastBackgroundBorder,
    this.typeInfoLabel = TypeInfoLabel.none,
    this.msg,
    this.msgPadding,
    this.isTextAdaptive = true,
    this.overlayColor,
    this.overlaySize = 8.0,
    this.overlayText,
    this.overlayTextColor,
    this.overlayTop = -2.0,
    this.overlayRight = -2.0,
    this.overlayBottom,
    this.overlayLeft,
    this.compactSize,
  }) : assert(!(text != null && titleWidget != null), '''\n
╔═ASSERTION ERROR
║ Choose one property:
║ • text
║ • titleWidget
║
║ Cannot use both.
║
║ 📝 Correct usage:
║
║ // Option 1
║ InfoLabel(
║   text: "Label",
║ )
║
║ // Option 2
║ InfoLabel(
║   titleWidget: Text("Label"),
║ )
║
║ ❌ Found:
║ text: $text
║ titleWidget: $titleWidget
╚═
''');

  /// Builds the shared data object from the widget properties.
  _InfoLabelData get _data => _InfoLabelData(
    text: text,
    titleWidget: titleWidget,
    textColor: textColor,
    borderColor: borderColor,
    backgroundColor: backgroundColor,
    globalColor: globalColor,
    textStyle: textStyle,
    fontSize: fontSize,
    contrastLevel: contrastLevel,
    roundedCorners: roundedCorners,
    smoothCorners: smoothCorners,
    rightIcon: rightIcon,
    leftIcon: leftIcon,
    typeColor: typeColor,
    typeInfoLabel: typeInfoLabel,
    mainAxisAlignment: mainAxisAlignment,
    crossAxisAlignment: crossAxisAlignment,
    leftIconPadding: leftIconPadding,
    rightIconPadding: rightIconPadding,
    textPadding: textPadding,
    msg: msg,
    msgPadding: msgPadding,
    isTextAdaptive: isTextAdaptive,
  );

  /// Returns an [_OverlayPainter] if overlay is configured, `null` otherwise.
  _OverlayPainter? get _overlayPainter => overlayColor != null
      ? _OverlayPainter(
          color: overlayColor!,
          overlaySize: overlaySize,
          text: overlayText,
          textColor: overlayTextColor,
          top: overlayTop,
          right: overlayRight,
          bottom: overlayBottom,
          left: overlayLeft,
        )
      : null;

  @override
  Widget build(BuildContext context) =>
      switch ((activeOnHover, compactSize != null)) {
    (true, _) => _HoverInfoLabel(
      data: _data,
      compactSize: compactSize,
      onHoverColor: onHoverColor,
      overlayPainter: _overlayPainter,
    ),
    (false, true) => _CompactInfoLabel(
      data: _data,
      size: compactSize!,
      overlayPainter: _overlayPainter,
    ),
    (false, false) => _BaseInfoLabel(
      data: _data,
      overlayPainter: _overlayPainter,
    ),
  };
}
