/// Enum representing different types of color distribution configurations for labels.
///
/// This enum provides a set of predefined configurations that determine how colors are distributed
/// across the label's components, such as text, background, and border. Each configuration
/// aims to optimize readability and visual appeal based on various color combinations.
///
/// The available configurations are:
/// - `solid`: Applies a single color to the entire label, including text, background, and border.
/// - `solidBorderTextContrastBackground`: Sets a solid color for the border and text,
///   while ensuring a contrasting color for the background.
/// - `solidBackgroundTextContrastBorder`: Sets a solid color for the background and text,
///   while ensuring a contrasting color for the border.
/// - `solidBackgroundBorderContrastText`: Sets a solid color for the background and border,
///   while ensuring a contrasting color for the text.
/// - `solidTextContrastBackgroundBorder`: Sets a solid color for the text,
///   while ensuring contrasting colors for the background and border.
/// - `fullContrast`: Applies full contrast by ensuring contrasting colors
///   for text, background, and border, enhancing visibility and readability.
///
/// Each configuration offers a unique visual appearance tailored to different design preferences
/// and readability requirements. Choosing the appropriate configuration can significantly impact
/// the label's overall aesthetics and usability.
///
/// Example Usage:
/// ```dart
/// TypeDistributionColor config = TypeDistributionColor.solidBackgroundTextContrastBorder;
/// ```
enum TypeDistributionColor {
  /// Applies a single color to the entire label, including text, background, and border.
  solid,

  /// Sets a solid color for the border and text, while ensuring a contrasting color for the background.
  solidBorderTextContrastBackground,

  /// Sets a solid color for the background and text, while ensuring a contrasting color for the border.
  solidBackgroundTextContrastBorder,

  /// Sets a solid color for the background and border, while ensuring a contrasting color for the text.
  solidBackgroundBorderContrastText,

  /// Sets a solid color for the text, while ensuring contrasting colors for the background and border.
  solidTextContrastBackgroundBorder,

  /// Applies full contrast by ensuring contrasting colors for text, background, and border, enhancing visibility and readability.
  fullContrast,
}
