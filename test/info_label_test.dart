import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_label/info_label.dart';

Widget _app(Widget child) => MaterialApp(home: Scaffold(body: child));

void main() {
  // --- Text rendering ---

  testWidgets('displays text correctly', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'Sample Text',
          typeInfoLabel: TypeInfoLabel.neutral,
        ),
      ),
    );
    expect(find.text('Sample Text'), findsOneWidget);
  });

  // --- Icon rendering ---

  testWidgets('displays left icon', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'With Icon',
          typeInfoLabel: TypeInfoLabel.neutral,
          leftIcon: Icon(Icons.warning),
        ),
      ),
    );
    expect(find.byIcon(Icons.warning), findsOneWidget);
  });

  testWidgets('displays right icon', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'With Icon',
          typeInfoLabel: TypeInfoLabel.neutral,
          rightIcon: Icon(Icons.check_circle),
        ),
      ),
    );
    expect(find.byIcon(Icons.check_circle), findsOneWidget);
  });

  // --- Type ---

  testWidgets('applies correct TypeInfoLabel', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(text: 'Typed', typeInfoLabel: TypeInfoLabel.success),
      ),
    );
    final widget = tester.widget<InfoLabel>(find.byType(InfoLabel));
    expect(widget.typeInfoLabel, TypeInfoLabel.success);
  });

  // --- Colors ---

  testWidgets('applies custom backgroundColor', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'Blue',
          typeInfoLabel: TypeInfoLabel.neutral,
          backgroundColor: Colors.blue,
        ),
      ),
    );
    final widget = tester.widget<InfoLabel>(find.byType(InfoLabel));
    expect(widget.backgroundColor, Colors.blue);
  });

  testWidgets('applies custom textColor to Text widget', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'Red Text',
          typeInfoLabel: TypeInfoLabel.neutral,
          textColor: Colors.red,
        ),
      ),
    );
    final text = tester.widget<Text>(find.text('Red Text'));
    expect(text.style?.color, Colors.red);
  });

  // --- Compact mode ---

  testWidgets('compact creates SizedBox with correct dimensions', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'S',
          typeInfoLabel: TypeInfoLabel.info,
          compactSize: 32,
        ),
      ),
    );
    final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox).first);
    expect(sizedBox.width, 32);
    expect(sizedBox.height, 32);
  });

  testWidgets('compact text-only provides Semantics label', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'X',
          typeInfoLabel: TypeInfoLabel.info,
          compactSize: 24,
        ),
      ),
    );
    expect(find.bySemanticsLabel('X'), findsOneWidget);
  });

  // --- Overlay ---

  testWidgets('overlayColor activates foregroundPainter', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'Badge',
          typeInfoLabel: TypeInfoLabel.info,
          overlayColor: Colors.red,
          overlaySize: 10,
        ),
      ),
    );
    final customPaint = tester.widget<CustomPaint>(
      find.byType(CustomPaint).first,
    );
    expect(customPaint.foregroundPainter, isNotNull);
  });

  testWidgets('no foregroundPainter when overlayColor is null', (tester) async {
    await tester.pumpWidget(
      _app(const InfoLabel(text: 'Clean', typeInfoLabel: TypeInfoLabel.info)),
    );
    // Find the CustomPaint that belongs to InfoLabel (has _InfoLabelBasePainter)
    final customPaints = tester.widgetList<CustomPaint>(
      find.byType(CustomPaint),
    );
    final infoLabelPaint = customPaints.where(
      (cp) => cp.painter.toString().contains('_InfoLabelBasePainter'),
    );
    expect(infoLabelPaint, isNotEmpty);
    expect(infoLabelPaint.first.foregroundPainter, isNull);
  });

  // --- Hover ---

  testWidgets('activeOnHover true creates MouseRegion with hover listeners', (
    tester,
  ) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'Hover',
          typeInfoLabel: TypeInfoLabel.info,
          activeOnHover: true,
        ),
      ),
    );
    // Scaffold adds its own MouseRegion, so look for at least 2
    expect(find.byType(MouseRegion), findsAtLeast(2));
  });

  testWidgets('activeOnHover false has no extra MouseRegion', (tester) async {
    await tester.pumpWidget(
      _app(const InfoLabel(text: 'Static', typeInfoLabel: TypeInfoLabel.info)),
    );
    // Only Scaffold's MouseRegion should exist, not one from _HoverInfoLabel
    expect(find.byType(MouseRegion), findsOneWidget);
  });

  // --- Message ---

  testWidgets('msg displays below text when both present', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          text: 'Title',
          typeInfoLabel: TypeInfoLabel.info,
          msg: Text('Description'),
        ),
      ),
    );
    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
  });

  testWidgets('msg as primary content when text is null', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          typeInfoLabel: TypeInfoLabel.info,
          msg: Text('Only Message'),
        ),
      ),
    );
    expect(find.text('Only Message'), findsOneWidget);
  });

  // --- titleWidget ---

  testWidgets('titleWidget renders when text is null', (tester) async {
    await tester.pumpWidget(
      _app(
        const InfoLabel(
          titleWidget: Icon(Icons.star),
          typeInfoLabel: TypeInfoLabel.info,
        ),
      ),
    );
    expect(find.byIcon(Icons.star), findsOneWidget);
  });
}
