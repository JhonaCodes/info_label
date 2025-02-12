import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:alchemist/alchemist.dart';
import 'package:info_label/info_label.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("INFO_LABEL_BASIC_TESTS", () {
    goldenTest(
      'Basic TypeInfoLabel Variations',
      fileName: 'golden_basic_type_info_label_test',
      builder: () => GoldenTestGroup(
        children: [
          // Test 1: Basic Success Label
          GoldenTestScenario(
            name: "Basic Success Label",
            child: const InfoLabel(
              text: "Success Message",
              typeInfoLabel: TypeInfoLabel.success,
            ),
          ),

          // Test 2: Error Label with Custom Font Size
          GoldenTestScenario(
            name: "Error Label with Custom Font",
            child: const InfoLabel(
              text: "Error Message",
              typeInfoLabel: TypeInfoLabel.error,
              fontSize: 18.0,
            ),
          ),

          // Test 3: Warning Label with Icons
          GoldenTestScenario(
            name: "Warning with Icons",
            child: const InfoLabel(
              text: "Warning Alert",
              typeInfoLabel: TypeInfoLabel.warning,
              leftIcon: Icon(Icons.warning),
              rightIcon: Icon(Icons.arrow_forward),
            ),
          ),

          // Test 4: Info Label with Custom Colors
          GoldenTestScenario(
            name: "Custom Colored Info",
            child: const InfoLabel(
              text: "Custom Info",
              typeInfoLabel: TypeInfoLabel.info,
              textColor: Colors.white,
              backgroundColor: Colors.indigo,
              borderColor: Colors.indigoAccent,
            ),
          ),

          // Test 5: Neutral Label with Message
          GoldenTestScenario(
            name: "Neutral with Message",
            child: const InfoLabel(
              text: "Main Title",
              typeInfoLabel: TypeInfoLabel.neutral,
              msg: Text("This is additional information displayed below"),
            ),
          ),

          // Test 6: Critical Label with Custom Alignment
          GoldenTestScenario(
            name: "Critical Custom Alignment",
            child: const InfoLabel(
              text: "Critical Alert",
              typeInfoLabel: TypeInfoLabel.critical,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),

          // Test 7: Pending Label with Custom Padding
          GoldenTestScenario(
            name: "Pending Custom Padding",
            child: const InfoLabel(
              text: "Pending Status",
              typeInfoLabel: TypeInfoLabel.pending,
              textPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),

          // Test 8: Disabled Label with Hover Disabled
          GoldenTestScenario(
            name: "Disabled No Hover",
            child: const InfoLabel(
              text: "Disabled State",
              typeInfoLabel: TypeInfoLabel.disabled,
              activeOnHover: false,
            ),
          ),

          // Test 9: Empty Label with Custom Border Radius
          GoldenTestScenario(
            name: "Empty Custom Corners",
            child: const InfoLabel(
              text: "Empty State",
              typeInfoLabel: TypeInfoLabel.empty,
              roundedCorners: 15.0,
            ),
          ),

          // Test 10: Dark Label with Global Color
          GoldenTestScenario(
            name: "Dark Global Color",
            child: const InfoLabel(
              text: "Dark Theme",
              typeInfoLabel: TypeInfoLabel.dark,
              globalColor: Colors.deepPurple,
            ),
          ),
        ],
      ),
    );
  });
}
