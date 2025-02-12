# Info Label

[![Dart 3](https://img.shields.io/badge/Dart-3%2B-blue.svg)](https://dart.dev/)
[![Flutter 3.10](https://img.shields.io/badge/Flutter-3%2B-blue.svg)](https://flutter.dev/)
[![Pub Package](https://img.shields.io/pub/v/info_label.svg)](https://pub.dev/packages/info_label)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

![info_label](https://github.com/JhonaCodes/info_label/assets/53523825/93dbd9f1-a589-45c5-bbd2-32d224d5bd48)


## Overview

Info Label is a Flutter library that provides customizable components for displaying information labels in Flutter applications. These labels can be used to convey various types of information, such as success messages, errors, warnings, or additional details, with flexible styling options.

## Features

- **InfoLabelWidget**: A widget for creating customizable information labels with text, icons, and various styling options.
- **TypeDistributionColor**: An enum defining different color distribution configurations for labels to optimize readability and visual appeal.
- **TypeInfoLabel**: An enum representing different types of labels with associated meanings and colors for quick and easy labeling of information.

## Getting Started

1. Add the `info_label` package to your `pubspec.yaml` file:

```yaml
dependencies:
  info_label: ^1.2.2
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
            typeColor: TypeDistributionColor.solid,
          ),
        ),
      ),
    );
  }
}
```
## Current Golden test.
![golden_customized_info_label_variations_test](https://github.com/user-attachments/assets/73eaf3a3-e0f6-4fb6-a46d-1f4f894a41da)
![golden_type_info_icons_test](https://github.com/user-attachments/assets/5624885d-56e8-4c5f-a36d-ba2988f4ded8)
![golden_type_info_label_test](https://github.com/user-attachments/assets/29bdcb2a-5e8e-4dc1-8760-180c10e55a33)

## On App.
<img width="200" alt="white_backgroud" src="https://github.com/JhonaCodes/info_label/assets/53523825/f59a4468-7303-4757-932c-b02aada584c7">
<img width="200" alt="black_background" src="https://github.com/JhonaCodes/info_label/assets/53523825/9f818316-2be0-4a19-aa09-42a2759fe072">


## Documentation

- [API Documentation](https://pub.dev/documentation/info_label/latest/)

## Contributing

Contributions to this project are welcome! If you have any ideas, suggestions, or find any issues, feel free to open an issue or submit a pull request on GitHub.

