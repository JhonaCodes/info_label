/// Library for customizable information labels in Flutter applications.
///
/// The `info_label` library provides a collection of components for creating
/// customizable information labels in Flutter applications. These labels can be
/// used to visually represent various types of information, such as success messages,
/// errors, warnings, and more, with flexible styling options.
///
/// Components exported by this library include:
/// - `InfoLabel`: A widget for displaying customizable information labels with
///   text, icons, and various styling options.
/// - `TypeDistributionColor`: An enum defining different color distribution
///   configurations for labels to optimize readability and visual appeal.
/// - `TypeInfoLabel`: An enum representing different types of labels with associated
///   meanings and colors for quick and easy labeling of information.
///
/// Example Usage:
/// ```dart
/// import 'package:info_label/info_label.dart';
///
/// void main() {
///   runApp(MyApp());
/// }
///
/// class MyApp extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     return MaterialApp(
///       home: Scaffold(
///         appBar: AppBar(
///           title: Text('Info Label Example'),
///         ),
///         body: Center(
///           child: InfoLabel(
///             text: 'Hello, World!',
///             backgroundColor: Colors.blue,
///             textColor: Colors.white,
///             typeColor: TypeDistributionColor.solid,
///           ),
///         ),
///       ),
///     );
///   }
/// }
/// ```
library info_label;

export 'package:info_label/src/ui/info_label_widget.dart';

export 'package:info_label/src/core/type_color.dart';
export 'package:info_label/src/core/type_info_label.dart';


