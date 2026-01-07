import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

final List<GoldenTestScenario> goldenAdvancedTest = [
  // Test 1: Success con layout moderno
  GoldenTestScenario(
    name: "Modern Success Layout",
    child: const Center(
      child: InfoLabel(
        text: "Task Completed",
        typeInfoLabel: TypeInfoLabel.success,
        leftIcon: Icon(Icons.task_alt),
        rightIcon: Icon(Icons.chevron_right),
        typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
        textStyle: TextStyle(
          fontSize: 13,
          letterSpacing: 0.5,
          fontWeight: FontWeight.w600,
        ),
        roundedCorners: 20,
        mainAxisAlignment: MainAxisAlignment.start,
        textPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      ),
    ),
  ),

  // Test 2: Error con estilo de notificación
  GoldenTestScenario(
    name: "Notification Style Error",
    child: const Center(
      child: InfoLabel(
        text: "Connection Lost",
        typeInfoLabel: TypeInfoLabel.error,
        leftIcon: Icon(Icons.wifi_off),
        msg: Text("Check your internet connection"),
        typeColor: TypeDistributionColor.solidBackgroundBorderContrastText,
        msgPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        roundedCorners: 4,
        contrastLevel: 0.15,
      ),
    ),
  ),

  // Test 3: Warning con estilo de banner
  GoldenTestScenario(
    name: "Banner Style Warning",
    child: const Center(
      child: InfoLabel(
        text: "Disk Space Low",
        typeInfoLabel: TypeInfoLabel.warning,
        leftIcon: Icon(Icons.storage),
        rightIcon: Icon(Icons.open_in_new),
        typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textPadding: EdgeInsets.all(12),
        roundedCorners: 0,
      ),
    ),
  ),

  // Test 4: Info con estilo de tag
  GoldenTestScenario(
    name: "Tag Style Info",
    child: const Center(
      child: InfoLabel(
        text: "Beta Feature",
        typeInfoLabel: TypeInfoLabel.info,
        leftIcon: Icon(Icons.new_releases_outlined),
        typeColor: TypeDistributionColor.solid,
        fontSize: 12,
        roundedCorners: 16,
        textPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    ),
  ),

  // Test 5: Critical con estilo de alerta prominente
  GoldenTestScenario(
    name: "Prominent Critical Alert",
    child: const Center(
      child: InfoLabel(
        text: "Security Alert",
        typeInfoLabel: TypeInfoLabel.critical,
        leftIcon: Icon(Icons.security),
        msg: Text("Unauthorized access detected"),
        typeColor: TypeDistributionColor.fullContrast,
        contrastLevel: 0.2,
        roundedCorners: 8,
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ),
  ),

  // Test 6: Pending con estilo de proceso
  GoldenTestScenario(
    name: "Process Style Pending",
    child: const Center(
      child: InfoLabel(
        text: "Uploading Files",
        typeInfoLabel: TypeInfoLabel.pending,
        leftIcon: Icon(Icons.cloud_upload),
        rightIcon: Icon(Icons.pending_actions),
        msg: Text("2 of 5 files remaining"),
        typeColor: TypeDistributionColor.solidBackgroundTextContrastBorder,
        textPadding: EdgeInsets.symmetric(horizontal: 16),
        msgPadding: EdgeInsets.all(8),
      ),
    ),
  ),

  // Test 7: Confirmed con estilo de badge
  GoldenTestScenario(
    name: "Badge Style Confirmed",
    child: const Center(
      child: InfoLabel(
        text: "Premium User",
        typeInfoLabel: TypeInfoLabel.confirmed,
        leftIcon: Icon(Icons.stars),
        typeColor: TypeDistributionColor.solidTextContrastBackgroundBorder,
        roundedCorners: 25,
        fontSize: 11,
        textPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
    ),
  ),

  // Test 8: Expired con estilo de alerta sutil
  GoldenTestScenario(
    name: "Subtle Alert Expired",
    child: const Center(
      child: InfoLabel(
        text: "Session Timeout",
        typeInfoLabel: TypeInfoLabel.expired,
        leftIcon: Icon(Icons.access_time_filled),
        rightIcon: Icon(Icons.refresh),
        typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
        contrastLevel: 0.1,
        roundedCorners: 6,
      ),
    ),
  ),

  // Test 9: Empty con estilo de placeholder
  GoldenTestScenario(
    name: "Placeholder Style Empty",
    child: const Center(
      child: InfoLabel(
        text: "No Results",
        typeInfoLabel: TypeInfoLabel.empty,
        leftIcon: Icon(Icons.search_off),
        msg: Text("Try adjusting your search filters"),
        typeColor: TypeDistributionColor.solidBackgroundBorderContrastText,
        textStyle: TextStyle(fontWeight: FontWeight.w300),
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    ),
  ),

  // Test 10: Disabled con estilo de overlay
  GoldenTestScenario(
    name: "Overlay Style Disabled",
    child: const Center(
      child: InfoLabel(
        text: "Maintenance Mode",
        typeInfoLabel: TypeInfoLabel.disabled,
        leftIcon: Icon(Icons.build),
        msg: Text("System updates in progress"),
        typeColor: TypeDistributionColor.fullContrast,
        contrastLevel: 0.4,
        roundedCorners: 10,
        textPadding: EdgeInsets.all(16),
      ),
    ),
  ),
];

void main() => runGoldenTest(
  goldenAdvancedTest,
  groupData: "INFO_LABEL_ADVANCED_LAYOUT_TEST",
  goldenName: 'Info Labels with Advanced Layouts',
  fileName: 'golden_info_advanced_layout_test',
);
