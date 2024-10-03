import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_label/info_label.dart';

void main() {
  testWidgets('InfoLabel renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InfoLabel(
            text: 'Hello, World!',
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            typeColor: TypeDistributionColor.solid,
          ),
        ),
      ),
    );

    // Verify that the InfoLabel is rendered
    expect(find.byType(InfoLabel), findsOneWidget);
  });

  testWidgets('InfoLabel customization test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: InfoLabel(
            text: 'Custom Label',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 20.0,
            leftIcon: Icon(Icons.info),
            rightIcon: Icon(Icons.check),
            roundedCorners: 10.0,
            typeColor: TypeDistributionColor.fullContrast,
          ),
        ),
      ),
    );

    // Verify that the customized InfoLabel is rendered
    expect(find.byType(InfoLabel), findsOneWidget);
  });
}
