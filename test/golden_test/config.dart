import 'dart:developer';

import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

runGoldenTest(
  List<Widget> testScenarios, {
  required String groupData,
  required String goldenName,
  required String fileName,
  PumpAction? pumpBeforeTest,
  int? columns,
  double? fixedWidth,
  Map<String, Object>? sharedPrefs,
  bool? catchOverflows,
}) {
  group(groupData, () {
    TestWidgetsFlutterBinding.ensureInitialized();
    setUpAll(() async {
      final fontLoader = FontLoader('Roboto');

      await fontLoader.load();
    });

    return AlchemistConfig.runWithConfig(
      config: AlchemistConfig(
        forceUpdateGoldenFiles: true,
        theme: ThemeData(fontFamily: 'Roboto'),
        goldenTestTheme: GoldenTestTheme(
          backgroundColor: Colors.grey.shade100,
          borderColor: Colors.grey.shade400,
          nameTextStyle: const TextStyle(fontFamily: 'Roboto'),
        ),
        platformGoldensConfig: const PlatformGoldensConfig(
          enabled: true,
          renderShadows: true,
        ),
        ciGoldensConfig: const CiGoldensConfig(enabled: false),
      ),
      run: () {
        goldenTest(
          goldenName,
          fileName: fileName,
          pumpBeforeTest: pumpBeforeTest ?? precacheImages,
          builder: () {
            final originalOnError = FlutterError.onError!;

            FlutterError.onError = (FlutterErrorDetails details) {
              final exception = details.exception;
              final isOverflowError =
                  exception is FlutterError &&
                  !exception.diagnostics.any(
                    (e) => e.value.toString().startsWith(
                      "A RenderFlex overflowed by",
                    ),
                  );

              if (isOverflowError && catchOverflows == true) {
                log("Flutter overflow error is being caught by golden test");
              } else {
                originalOnError(details); // call test framework's error handler
              }
            };

            return GoldenTestGroup(
              columns: columns,
              columnWidthBuilder: fixedWidth != null
                  ? (_) => FixedColumnWidth(fixedWidth)
                  : null,
              children: testScenarios,
            );
          },
        );
      },
    );
  });
}

class ScenarioWidget extends StatelessWidget {
  final Widget child;

  const ScenarioWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = ThemeData.light();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: DefaultTextStyle(
        style: currentTheme.textTheme.bodyMedium!,
        child: child,
      ),
    );
  }
}
