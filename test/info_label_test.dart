import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_label/info_label.dart';

void main() {
  testWidgets('InfoLabel displays correct text', (WidgetTester tester) async {
    const String expectedText = "Sample Text";

    await tester.pumpWidget(_materialTest(
      const InfoLabel(
        text: expectedText,
        typeInfoLabel: TypeInfoLabel.neutral,
      ),
    ));

    final textFinder = find.text(expectedText);

    expect(textFinder, findsOneWidget);
  });

  testWidgets('InfoLabel displays correct left icon',
      (WidgetTester tester) async {
    const IconData expectedLeftIcon = Icons.warning;

    await tester.pumpWidget(_materialTest(const InfoLabel(
      text: "Sample Text",
      leftIcon: Icon(expectedLeftIcon),
      typeInfoLabel: TypeInfoLabel.neutral,
    )));

    final iconFinder = find.byIcon(expectedLeftIcon);

    expect(iconFinder, findsOneWidget);
  });

  testWidgets('InfoLabel displays correct right icon',
      (WidgetTester tester) async {
    const IconData expectedRightIcon = Icons.check_circle;

    await tester.pumpWidget(_materialTest(
      const InfoLabel(
        text: "Sample Text",
        rightIcon: Icon(expectedRightIcon),
        typeInfoLabel: TypeInfoLabel.neutral,
      ),
    ));

    final iconFinder = find.byIcon(expectedRightIcon);

    expect(iconFinder, findsOneWidget);
  });

  testWidgets('InfoLabel displays correct type of label',
      (WidgetTester tester) async {
    const TypeInfoLabel expectedType = TypeInfoLabel.warning;

    await tester.pumpWidget(_materialTest(
      const InfoLabel(
        text: "Sample Text",
        typeInfoLabel: expectedType,
      ),
    ));

    final labelFinder = find.byWidgetPredicate(
      (widget) =>
          widget is InfoLabel && widget.typeInfoLabel.name == expectedType.name,
    );

    expect(labelFinder, findsOneWidget);
  });

  testWidgets('InfoLabel displays correct background color',
      (WidgetTester tester) async {
    const Color expectedBackgroundColor = Colors.blue;

    await tester.pumpWidget(_materialTest(const InfoLabel(
      text: "Sample Text",
      backgroundColor: expectedBackgroundColor,
      typeInfoLabel: TypeInfoLabel.neutral,
    )));

    final containerFinder = find.byWidgetPredicate(
      (widget) =>
          widget is InfoLabel &&
          widget.backgroundColor == expectedBackgroundColor,
    );

    expect(containerFinder, findsOneWidget);
  });

  testWidgets('InfoLabel displays correct text color',
      (WidgetTester tester) async {
    const Color expectedTextColor = Colors.red;

    await tester.pumpWidget(_materialTest(
      const InfoLabel(
        text: "Sample Text",
        textColor: expectedTextColor,
        typeInfoLabel: TypeInfoLabel.neutral,
      ),
    ));

    final textFinder = find.byWidgetPredicate(
      (widget) => widget is Text && widget.style!.color == expectedTextColor,
    );

    expect(textFinder, findsOneWidget);
  });
}

Widget _materialTest(Widget child) => MaterialApp(
      home: Scaffold(
        body: child,
      ),
    );
