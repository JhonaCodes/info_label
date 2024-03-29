/// Enum representing different types of labels with associated meanings and colors.
///
/// This enum provides a set of predefined labels, each representing a specific type of information.
/// Each label has an associated color that conveys its meaning visually.
///
/// The available labels are:
/// - `success`: Indicates successful operation or positive outcome.
/// - `error`: Indicates errors or failures.
/// - `neutral`: Represents neutral or unbiased information.
/// - `warning`: Indicates potential issues or warnings.
/// - `empty`: Represents absence of data or content.
/// - `dark`: Represents dark or low-visibility information.
/// - `info`: Provides additional information or details.
/// - `pending`: Indicates operations that are pending or in progress.
/// - `confirmed`: Indicates confirmed or verified information.
/// - `expired`: Represents expired or outdated information.
/// - `disabled`: Indicates disabled or inactive elements.
/// - `critical`: Indicates critical or urgent information.
/// - `none`: Represents a default or undefined state.
///
/// Example Usage:
/// ```dart
/// TypeInfoLabel label = TypeInfoLabel.error;
/// ```
///
/// The colors associated with each label are provided by the `_ColorByTypeInfo` mixin.
enum TypeInfoLabel {
  /// Indicates successful operation or positive outcome.
  success,

  /// Indicates errors or failures.
  error,

  /// Represents neutral or unbiased information.
  neutral,

  /// Indicates potential issues or warnings.
  warning,

  /// Represents absence of data or content.
  empty,

  /// Represents dark or low-visibility information.
  dark,

  /// Provides additional information or details.
  info,

  /// Indicates operations that are pending or in progress.
  pending,

  /// Indicates confirmed or verified information.
  confirmed,

  /// Represents expired or outdated information.
  expired,

  /// Indicates disabled or inactive elements.
  disabled,

  /// Indicates critical or urgent information.
  critical,

  /// Represents a default or undefined state.
  none,
}
