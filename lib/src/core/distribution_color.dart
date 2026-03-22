import 'package:flutter/material.dart';
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
class DistributionColor {
  /// Color of the label's border.
  final Color? borderColor;

  /// Color of the label's background.
  final Color backgroundColor;

  /// Color of the label's text.
  final Color? textColor;

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
    this.borderColor = Colors.transparent,
    required this.backgroundColor,
    this.textColor,
    required this.contrastLevel,
  });

  /// Retrieves a new instance of [DistributionColor] with solid color distribution.
  ///
  /// In solid mode, background and border are the full type color.
  /// When [textColor] is not explicitly set, it auto-selects black or white
  /// based on the background luminance to ensure readability on both
  /// dark backgrounds (success, dark, critical) and light backgrounds
  /// (empty, pending, confirmed).
  DistributionColor get _solid => DistributionColor(
    backgroundColor: backgroundColor,
    borderColor: borderColor,
    contrastLevel: 1,
    textColor: textColor ?? _autoTextColor(backgroundColor),
  );

  /// Retrieves a new instance of [DistributionColor] with solid border, text contrast background.
  ///
  /// This configuration sets a solid color for the label's border and text,
  /// while ensuring a contrasting color for the background, enhancing readability.
  DistributionColor get _solidBorderTextContrastBackground => DistributionColor(
    backgroundColor: backgroundColor.withValues(alpha: contrastLevel),
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
    borderColor: borderColor?.withValues(alpha: contrastLevel),
    contrastLevel: contrastLevel,
    textColor: textColor ?? _autoTextColor(backgroundColor),
  );

  /// Retrieves a new instance of [DistributionColor] with solid background, border contrast text.
  ///
  /// This configuration sets a solid color for the label's background and border,
  /// while ensuring a contrasting color for the text, improving legibility.
  DistributionColor get _solidBackgroundBorderContrastText => DistributionColor(
    backgroundColor: backgroundColor,
    borderColor: borderColor,
    contrastLevel: contrastLevel,
    textColor: (textColor ?? _autoTextColor(backgroundColor))
        .withValues(alpha: contrastLevel),
  );

  /// Retrieves a new instance of [DistributionColor] with solid text, contrast background border.
  ///
  /// This configuration sets a solid color for the label's text,
  /// while ensuring contrasting colors for the background and border, optimizing readability.
  DistributionColor get _solidTextContrastBackgroundBorder => DistributionColor(
    backgroundColor: backgroundColor.withValues(alpha: contrastLevel),
    contrastLevel: contrastLevel,
    textColor: textColor ?? backgroundColor,
  );

  /// Retrieves a new instance of [DistributionColor] with full contrast.
  ///
  /// In a full contrast configuration, contrasting colors are applied to the label's
  /// text, background, and border, maximizing visibility and readability.
  DistributionColor get _fullContrast => DistributionColor(
    backgroundColor: backgroundColor.withValues(alpha: contrastLevel),
    borderColor: borderColor?.withValues(alpha: contrastLevel),
    contrastLevel: contrastLevel,
    textColor: (textColor ?? _autoTextColor(backgroundColor))
        .withValues(alpha: contrastLevel),
  );

  /// Picks black or white text depending on the [bg] luminance.
  static Color _autoTextColor(Color bg) =>
      bg.computeLuminance() > 0.4 ? Colors.black87 : Colors.white;

  /// Returns a new instance of [DistributionColor] based on the specified [typeColor].
  ///
  /// This method selects and returns the appropriate color distribution configuration
  /// based on the provided [typeColor] from the `TypeDistributionColor` enum.
  DistributionColor labelInfoColors({
    required TypeDistributionColor typeColor,
  }) => switch (typeColor) {
    .solid => _solid,
    .solidBackgroundBorderContrastText => _solidBackgroundBorderContrastText,
    .solidBackgroundTextContrastBorder => _solidBackgroundTextContrastBorder,
    .solidBorderTextContrastBackground => _solidBorderTextContrastBackground,
    .solidTextContrastBackgroundBorder => _solidTextContrastBackgroundBorder,
    .fullContrast => _fullContrast,
  };
}
