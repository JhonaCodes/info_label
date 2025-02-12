import 'package:flutter/material.dart';
import 'package:alchemist/alchemist.dart';

import 'package:info_label/info_label.dart';

import 'config.dart';

final List<GoldenTestScenario> goldenIconsTest = [
  // Test 1: Success con ícono y mensaje
  GoldenTestScenario(
    name: "Success Icon Label",
    child: const ScenarioWidget(
      child: InfoLabel(
        text: "Operation Complete",
        typeInfoLabel: TypeInfoLabel.success,
        leftIcon: Icon(Icons.check_circle_outline),
        msg: Text("Process finished successfully"),
        typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
        roundedCorners: 8.0,
      ),
    ),
  ),

  // Test 2: Error con íconos a ambos lados
  GoldenTestScenario(
    name: "Error Double Icon",
    child: const Center(
      child: InfoLabel(
        text: "Error Found",
        typeInfoLabel: TypeInfoLabel.error,
        leftIcon: Icon(Icons.error_outline),
        rightIcon: Icon(Icons.arrow_forward_ios),
        typeColor: TypeDistributionColor.solid,
        contrastLevel: 1.0,
      ),
    ),
  ),

  // Test 3: Warning con ícono personalizado
  GoldenTestScenario(
    name: "Warning Custom Icon",
    child: Center(
      child: InfoLabel(
        text: "System Warning",
        typeInfoLabel: TypeInfoLabel.warning,
        leftIcon: Icon(Icons.warning_amber, color: Colors.orange[800]),
        typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
        contrastLevel: 0.2,
      ),
    ),
  ),

  // Test 4: Info con ícono y estilo personalizado
  GoldenTestScenario(
    name: "Info Styled Icon",
    child: const Center(
      child: InfoLabel(
        text: "Information Notice",
        typeInfoLabel: TypeInfoLabel.info,
        rightIcon: Icon(Icons.info_outline),
        typeColor: TypeDistributionColor.fullContrast,
        fontSize: 14.0,
        roundedCorners: 12.0,
      ),
    ),
  ),

  // Test 5: Critical con ícono de alerta
  GoldenTestScenario(
    name: "Critical Alert Icon",
    child: const Center(
      child: InfoLabel(
        text: "Critical Alert",
        typeInfoLabel: TypeInfoLabel.critical,
        leftIcon: Icon(Icons.report_problem),
        typeColor: TypeDistributionColor.solidBackgroundBorderContrastText,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ),
  ),

  // Test 6: Pending con ícono de carga
  GoldenTestScenario(
    name: "Pending Loading Icon",
    child: const Center(
      child: InfoLabel(
        text: "Processing",
        typeInfoLabel: TypeInfoLabel.pending,
        leftIcon: Icon(Icons.hourglass_empty),
        rightIcon: Icon(Icons.more_horiz),
        typeColor: TypeDistributionColor.solidBackgroundTextContrastBorder,
      ),
    ),
  ),

  // Test 7: Confirmed con ícono verificado
  GoldenTestScenario(
    name: "Confirmed Check Icon",
    child: const Center(
      child: InfoLabel(
        text: "Verified Account",
        typeInfoLabel: TypeInfoLabel.confirmed,
        leftIcon: Icon(Icons.verified_user),
        typeColor: TypeDistributionColor.solid,
        contrastLevel: 0.9,
      ),
    ),
  ),

  // Test 8: Expired con ícono de tiempo
  GoldenTestScenario(
    name: "Expired Time Icon",
    child: const Center(
      child: InfoLabel(
        text: "License Expired",
        typeInfoLabel: TypeInfoLabel.expired,
        leftIcon: Icon(Icons.timer_off),
        msg: Text("Please renew your subscription"),
        typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
      ),
    ),
  ),

  // Test 9: Empty con ícono de caja vacía
  GoldenTestScenario(
    name: "Empty Box Icon",
    child: const Center(
      child: InfoLabel(
        text: "No Items Found",
        typeInfoLabel: TypeInfoLabel.empty,
        leftIcon: Icon(Icons.inbox),
        typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
        roundedCorners: 6.0,
      ),
    ),
  ),

  // Test 10: Disabled con ícono de bloqueo
  GoldenTestScenario(
    name: "Disabled Lock Icon",
    child: const Center(
      child: InfoLabel(
        text: "Feature Unavailable",
        typeInfoLabel: TypeInfoLabel.disabled,
        leftIcon: Icon(Icons.lock_outline),
        typeColor: TypeDistributionColor.fullContrast,
        contrastLevel: 0.3,
      ),
    ),
  ),
];

void main() => runGoldenTest(
      goldenIconsTest,
      groupData: "INFO_LABEL_WITH_ICONS_TEST",
      goldenName: 'Info Labels with Various Icons',
      fileName: 'golden_info_complex_layout_test',
    );
