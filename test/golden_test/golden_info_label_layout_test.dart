import 'package:flutter/material.dart';
import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:info_label/info_label.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group("INFO_LABEL_ICONS_AND_LAYOUTS_TESTS", () {
    AlchemistConfig.runWithConfig(
      config: const AlchemistConfig(
        ciGoldensConfig: CiGoldensConfig(enabled: false),
      ),
      run: () => goldenTest(
        'Icons and Complex Layouts Variations',
        fileName: 'golden_icons_layouts_test',
        builder: () => GoldenTestGroup(
          children: [
            // Test 1: Expired Label with Material Icons
            GoldenTestScenario(
              name: "Expired with Icons",
              child: const InfoLabel(
                text: "License Expired",
                typeInfoLabel: TypeInfoLabel.expired,
                leftIcon: Icon(
                  Icons.warning_amber_rounded,
                  color: Colors.amber,
                ),
                rightIcon: Icon(Icons.timer_off, color: Colors.red),
                typeColor:
                    TypeDistributionColor.solidBackgroundBorderContrastText,
                textPadding: EdgeInsets.symmetric(horizontal: 12.0),
              ),
            ),

            // Test 2: Confirmed State with Animated Loading
            GoldenTestScenario(
              name: "Confirmed with Loading",
              child: const InfoLabel(
                text: "Processing Payment",
                typeInfoLabel: TypeInfoLabel.confirmed,
                leftIcon: Icon(Icons.sync, color: Colors.green),
                textColor: Colors.green,
                contrastLevel: 0.1,
                roundedCorners: 20.0,
              ),
            ),

            // Test 3: Critical Alert with Custom Layout
            GoldenTestScenario(
              name: "Critical Custom Icons",
              child: const InfoLabel(
                text: "System Alert",
                typeInfoLabel: TypeInfoLabel.critical,
                leftIcon: Icon(Icons.error_outline, size: 24),
                rightIcon: Icon(Icons.arrow_forward_ios, size: 16),
                mainAxisAlignment: MainAxisAlignment.start,
                typeColor: TypeDistributionColor.fullContrast,
              ),
            ),

            // Test 4: Info with Badge Style
            GoldenTestScenario(
              name: "Info Badge",
              child: const InfoLabel(
                text: "New Features",
                typeInfoLabel: TypeInfoLabel.info,
                leftIcon: Icon(Icons.new_releases, size: 18),
                typeColor: TypeDistributionColor.solid,
                roundedCorners: 25.0,
                textPadding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
            ),

            // Test 5: Success with Progress Indicator
            GoldenTestScenario(
              name: "Success Progress",
              child: const InfoLabel(
                text: "Upload Complete",
                typeInfoLabel: TypeInfoLabel.success,
                rightIcon: Icon(Icons.check_circle_outline),
                msg: Text("100% Completed"),
                typeColor:
                    TypeDistributionColor.solidTextContrastBackgroundBorder,
              ),
            ),

            // Test 6: Warning with Custom Icon Colors
            GoldenTestScenario(
              name: "Warning Custom Icons",
              child: InfoLabel(
                text: "Low Storage",
                typeInfoLabel: TypeInfoLabel.warning,
                leftIcon: Icon(Icons.storage, color: Colors.orange[800]),
                rightIcon: Icon(Icons.chevron_right, color: Colors.orange[800]),
                typeColor:
                    TypeDistributionColor.solidBorderTextContrastBackground,
                contrastLevel: 0.15,
              ),
            ),

            // Test 7: Neutral with Split Icons
            GoldenTestScenario(
              name: "Neutral Split Layout",
              child: const InfoLabel(
                text: "File Details",
                typeInfoLabel: TypeInfoLabel.neutral,
                leftIcon: Icon(Icons.description),
                rightIcon: Icon(Icons.more_vert),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                typeColor:
                    TypeDistributionColor.solidBackgroundTextContrastBorder,
              ),
            ),

            // Test 8: Disabled with Tooltip Style
            GoldenTestScenario(
              name: "Disabled Tooltip",
              child: const InfoLabel(
                text: "Premium Feature",
                typeInfoLabel: TypeInfoLabel.disabled,
                leftIcon: Icon(Icons.lock),
                typeColor: TypeDistributionColor.solid,
                roundedCorners: 4.0,
                msg: Text("Upgrade to access this feature"),
                msgPadding: EdgeInsets.all(8.0),
              ),
            ),

            // Test 9: Empty State with Placeholder
            GoldenTestScenario(
              name: "Empty Placeholder",
              child: const InfoLabel(
                text: "No Data",
                typeInfoLabel: TypeInfoLabel.empty,
                leftIcon: Icon(Icons.inbox),
                typeColor:
                    TypeDistributionColor.solidBackgroundBorderContrastText,
                msg: Text("Add items to see them here"),
                textPadding: EdgeInsets.symmetric(vertical: 12.0),
              ),
            ),

            // Test 10: Pending with Interactive Elements
            GoldenTestScenario(
              name: "Pending Interactive",
              child: const InfoLabel(
                text: "Awaiting Approval",
                typeInfoLabel: TypeInfoLabel.pending,
                leftIcon: Icon(Icons.access_time),
                rightIcon: Icon(Icons.refresh),
                typeColor: TypeDistributionColor.fullContrast,
                contrastLevel: 0.2,
                activeOnHover: true,
                msg: Text("Click to check status"),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
