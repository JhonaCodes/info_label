/// High-performance information label widget for Flutter.
///
/// Built on `CustomPainter` — background, border, text (compact mode),
/// and overlay indicators are painted directly on canvas for minimal
/// widget overhead.
///
/// Features:
/// - [InfoLabel]: Main widget with composable features (compact, overlay, hover).
/// - [TypeInfoLabel]: 13 label types with auto-contrast text color.
/// - [TypeDistributionColor]: 6 color distribution modes.
///
/// ```dart
/// // Basic
/// InfoLabel(text: "Success", typeInfoLabel: TypeInfoLabel.success)
///
/// // Compact with overlay
/// InfoLabel(
///   text: "S",
///   compactSize: 24,
///   overlayColor: Colors.red,
///   overlayText: "3",
/// )
/// ```
library info_label;

export 'package:info_label/src/ui/info_label_widget.dart';

export 'package:info_label/src/core/type_color.dart';
export 'package:info_label/src/core/type_info_label.dart';
