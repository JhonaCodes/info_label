Claro, aquí tienes un ejemplo detallado de un archivo README para tu biblioteca `info_label`:


# Info Label

![Flutter](https://img.shields.io/badge/Platform-Flutter-brightgreen)
[![Pub Package](https://img.shields.io/pub/v/info_label.svg)](https://pub.dev/packages/info_label)
[![License](https://img.shields.io/github/license/yourusername/info_label.svg)](https://opensource.org/licenses/MIT)

## Overview

Info Label is a Flutter library that provides customizable components for displaying information labels in Flutter applications. These labels can be used to convey various types of information, such as success messages, errors, warnings, or additional details, with flexible styling options.

## Features

- **InfoLabelWidget**: A widget for creating customizable information labels with text, icons, and various styling options.
- **TypeDistributionColor**: An enum defining different color distribution configurations for labels to optimize readability and visual appeal.
- **TypeInfoLabel**: An enum representing different types of labels with associated meanings and colors for quick and easy labeling of information.

## Installation

To use this package, add `info_label` as a dependency in your `pubspec.yaml` file. For example:

```yaml
dependencies:
  flutter:
    sdk: flutter
  info_label: ^1.0.1
```

Then, import the library in your Dart code:

```dart
import 'package:info_label/info_label.dart';
```

## Usage

Here's a simple example demonstrating how to use the `InfoLabelWidget`:

```dart
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Info Label Example'),
        ),
        body: Center(
          child: InfoLabel(
            text: 'Hello, World!',
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            typeColor: TypeDistributionColor.solid,
          ),
        ),
      ),
    );
  }
}
```

## Documentation

- [API Documentation](https://pub.dev/documentation/info_label/latest/)

## Contributing

Contributions to this project are welcome! If you have any ideas, suggestions, or find any issues, feel free to open an issue or submit a pull request on GitHub.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
```