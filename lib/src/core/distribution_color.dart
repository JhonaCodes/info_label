import 'dart:ui';

import 'package:info_label/src/core/type_color.dart';

/// Class representing color distribution configurations for labels.
///
/// This class defines various color distribution configurations used to style labels,
/// ensuring optimal contrast and readability based on different color combinations.
///
/// Each instance of `DistributionColor` encapsulates colors for the border, background,
/// and text of a label, along with a contrast level parameter that determines the
/// degree of contrast between these colors.
///
/// Example Usage:
/// ```dart
/// final colorConfig = DistributionColor(
///   borderColor: Colors.black,
///   backgroundColor: Colors.white,
///   textColor: Colors.black,
///   contrastLevel: 0.3,
/// );
/// ```
class DistributionColor{

  /// Color of the label's border.
  final Color borderColor;

  /// Color of the label's background.
  final Color backgroundColor;

  /// Color of the label's text.
  final Color textColor;

  /// Contrast level between the label's colors.
  ///
  /// The contrast level determines the degree of difference in brightness between
  /// the text and background colors, affecting readability.
  final double contrastLevel;

  /// Creates a new instance of [DistributionColor].
  ///
  /// The [borderColor], [backgroundColor], [textColor], and [contrastLevel] parameters
  /// are required to define the color distribution configuration.
  const DistributionColor({
    required this.borderColor,
    required this.backgroundColor,
    required this.textColor,
    required this.contrastLevel,
  });

  /// Retrieves a new instance of [DistributionColor] with solid color distribution.
  ///
  /// In a solid color configuration, the same color is applied to the label's
  /// background, border, and text, ensuring a consistent appearance.
  DistributionColor get _solid  => DistributionColor(
    backgroundColor: backgroundColor,
    borderColor: borderColor,
    contrastLevel: 1,
    textColor: textColor,
  );

  /// Retrieves a new instance of [DistributionColor] with solid border, text contrast background.
  ///
  /// This configuration sets a solid color for the label's border and text,
  /// while ensuring a contrasting color for the background, enhancing readability.
  DistributionColor get _solidBorderTextContrastBackground => DistributionColor(
    backgroundColor: backgroundColor.withOpacity(contrastLevel),
    borderColor: borderColor,
    contrastLevel: contrastLevel,
    textColor: textColor,
  );

  /// Retrieves a new instance of [DistributionColor] with solid background, text contrast border.
  ///
  /// This configuration sets a solid color for the label's background and text,
  /// while ensuring a contrasting color for the border, enhancing visibility.
  DistributionColor get _solidBackgroundTextContrastBorder => DistributionColor(
    backgroundColor: backgroundColor,
    borderColor: borderColor.withOpacity(contrastLevel),
    contrastLevel: contrastLevel,
    textColor: textColor,
  );

  /// Retrieves a new instance of [DistributionColor] with solid background, border contrast text.
  ///
  /// This configuration sets a solid color for the label's background and border,
  /// while ensuring a contrasting color for the text, improving legibility.
  DistributionColor get _solidBackgroundBorderContrastText => DistributionColor(
    backgroundColor: backgroundColor,
    borderColor: borderColor,
    contrastLevel: contrastLevel,
    textColor: textColor.withOpacity(contrastLevel),
  );

  /// Retrieves a new instance of [DistributionColor] with solid text, contrast background border.
  ///
  /// This configuration sets a solid color for the label's text,
  /// while ensuring contrasting colors for the background and border, optimizing readability.
  DistributionColor get _solidTextContrastBackgroundBorder => DistributionColor(
    backgroundColor: backgroundColor.withOpacity(contrastLevel),
    borderColor: borderColor.withOpacity(contrastLevel),
    contrastLevel: contrastLevel,
    textColor: textColor,
  );

  /// Retrieves a new instance of [DistributionColor] with full contrast.
  ///
  /// In a full contrast configuration, contrasting colors are applied to the label's
  /// text, background, and border, maximizing visibility and readability.
  DistributionColor get _fullContrast => DistributionColor(
    backgroundColor: backgroundColor.withOpacity(contrastLevel),
    borderColor: borderColor.withOpacity(contrastLevel),
    contrastLevel: contrastLevel,
    textColor: textColor.withOpacity(contrastLevel),
  );

  /// Returns a new instance of [DistributionColor] based on the specified [typeColor].
  ///
  /// This method selects and returns the appropriate color distribution configuration
  /// based on the provided [typeColor] from the `TypeDistributionColor` enum.
  DistributionColor labelInfoColors({required TypeDistributionColor typeColor}) => switch(typeColor){
    TypeDistributionColor.solid => _solid,
    TypeDistributionColor.solidBackgroundBorderContrastText => _solidBackgroundBorderContrastText,
    TypeDistributionColor.solidBackgroundTextContrastBorder => _solidBackgroundTextContrastBorder,
    TypeDistributionColor.solidBorderTextContrastBackground => _solidBorderTextContrastBackground,
    TypeDistributionColor.solidTextContrastBackgroundBorder => _solidTextContrastBackgroundBorder,
    TypeDistributionColor.fullContrast => _fullContrast,
  };



}