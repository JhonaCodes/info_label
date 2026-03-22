import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_label/info_label.dart';

/// Tests for the assertion that text and titleWidget are mutually exclusive.
void main() {
  testWidgets('throws when both text and titleWidget are provided', (tester) async {
    expect(
      () => InfoLabel(
        text: 'Hello',
        titleWidget: const Text('World'),
        typeInfoLabel: TypeInfoLabel.info,
      ),
      throwsAssertionError,
    );
  });

  testWidgets('does not throw with only text', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: InfoLabel(
          text: 'Hello',
          typeInfoLabel: TypeInfoLabel.info,
        ),
      ),
    );
    expect(find.text('Hello'), findsOneWidget);
  });

  testWidgets('does not throw with only titleWidget', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: InfoLabel(
          titleWidget: Text('World'),
          typeInfoLabel: TypeInfoLabel.info,
        ),
      ),
    );
    expect(find.text('World'), findsOneWidget);
  });

  testWidgets('does not throw with neither (msg as content)', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: InfoLabel(
          typeInfoLabel: TypeInfoLabel.info,
          msg: Text('Fallback'),
        ),
      ),
    );
    expect(find.text('Fallback'), findsOneWidget);
  });
}
