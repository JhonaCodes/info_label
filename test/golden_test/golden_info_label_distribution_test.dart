import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

final List<Widget> distributionTestScenarios = [
  // Test 1: Solid Distribution with Success
  GoldenTestScenario(
    name: "Solid Distribution Success",
    child: const InfoLabel(
      text: "Solid Success",
      typeInfoLabel: TypeInfoLabel.success,
      typeColor: TypeDistributionColor.solid,
      contrastLevel: 1.0,
    ),
  ),

  // Test 2: Solid Border Text Contrast Background
  GoldenTestScenario(
    name: "Border Text Contrast Background",
    child: const InfoLabel(
      text: "Contrast Background",
      typeInfoLabel: TypeInfoLabel.info,
      typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
      contrastLevel: 0.2,
      leftIcon: Icon(Icons.info),
    ),
  ),

  // Test 3: Solid Background Text Contrast Border
  GoldenTestScenario(
    name: "Background Text Contrast Border",
    child: const InfoLabel(
      text: "Custom Border Contrast",
      typeInfoLabel: TypeInfoLabel.warning,
      typeColor: TypeDistributionColor.solidBackgroundTextContrastBorder,
      contrastLevel: 0.4,
      roundedCorners: 10.0,
    ),
  ),

  // Test 4: Solid Background Border Contrast Text
  GoldenTestScenario(
    name: "Background Border Contrast Text",
    child: const InfoLabel(
      text: "Contrast Text Style",
      typeInfoLabel: TypeInfoLabel.critical,
      typeColor: TypeDistributionColor.solidBackgroundBorderContrastText,
      fontSize: 16.0,
      msg: Text("With contrasting message text"),
    ),
  ),

  // Test 5: Solid Text Contrast Background Border
  GoldenTestScenario(
    name: "Text Contrast Background Border",
    child: const InfoLabel(
      text: "Full Layout Test",
      typeInfoLabel: TypeInfoLabel.confirmed,
      typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
      leftIcon: Icon(Icons.check_circle),
      rightIcon: Icon(Icons.arrow_forward),
      contrastLevel: 0.15,
    ),
  ),

  // Test 6: Full Contrast with Custom Colors
  GoldenTestScenario(
    name: "Full Contrast Custom",
    child: const InfoLabel(
      text: "Maximum Contrast",
      typeInfoLabel: TypeInfoLabel.expired,
      typeColor: TypeDistributionColor.fullContrast,
      backgroundColor: Colors.deepOrange,
      textColor: Colors.white,
      borderColor: Colors.orange,
    ),
  ),

  // Test 7: Solid Distribution with Message
  GoldenTestScenario(
    name: "Solid With Message",
    child: const InfoLabel(
      text: "Solid Style",
      typeInfoLabel: TypeInfoLabel.neutral,
      typeColor: TypeDistributionColor.solid,
      msg: Text("This is a message with solid distribution"),
      msgPadding: EdgeInsets.all(10),
    ),
  ),

  // Test 8: Full Contrast with Icons and Padding
  GoldenTestScenario(
    name: "Full Contrast with Custom Padding",
    child: const InfoLabel(
      text: "Custom Padding Test",
      typeInfoLabel: TypeInfoLabel.pending,
      typeColor: TypeDistributionColor.fullContrast,
      leftIconPadding: EdgeInsets.all(8),
      rightIconPadding: EdgeInsets.all(8),
      textPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leftIcon: Icon(Icons.hourglass_empty),
      rightIcon: Icon(Icons.refresh),
    ),
  ),

  // Test 9: Complex Distribution with Global Color
  GoldenTestScenario(
    name: "Global Color Distribution",
    child: const InfoLabel(
      text: "Global Override",
      typeInfoLabel: TypeInfoLabel.none,
      typeColor: TypeDistributionColor.solidBackgroundBorderContrastText,
      globalColor: Colors.teal,
      contrastLevel: 0.25,
      roundedCorners: 8.0,
    ),
  ),

  // Test 10: Multiple Features Combined
  GoldenTestScenario(
    name: "Combined Features",
    child: const InfoLabel(
      text: "Complete Test",
      typeInfoLabel: TypeInfoLabel.disabled,
      typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
      contrastLevel: 0.35,
      leftIcon: Icon(Icons.block),
      msg: Text("Testing all features together"),
      mainAxisAlignment: MainAxisAlignment.center,
      activeOnHover: true,
      roundedCorners: 12.0,
    ),
  ),
];

void main() => runGoldenTest(
      distributionTestScenarios,
      groupData: "INFO_LABEL_COLOR_DISTRIBUTION_TESTS",
      goldenName: 'Color Distribution Variations',
      fileName: 'golden_color_distribution_test',
    );
