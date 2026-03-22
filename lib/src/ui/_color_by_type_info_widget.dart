part of 'info_label_widget.dart';

/// Provides static methods to retrieve colors based on TypeInfoLabel.
///
/// Example Usage:
/// ```dart
/// final successColor = _ColorByTypeInfo.get(TypeInfoLabel.success);
/// ```
mixin _ColorByTypeInfo {
  /// Returns a Color based on the provided TypeInfoLabel.
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
