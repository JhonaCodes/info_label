// Hover state visual comparison.
// Shows normal and hover states side-by-side. Hover is simulated by
// applying the hover color directly as backgroundColor.
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  runGoldenTest(
    [
      scenario('base_info_normal', const InfoLabel(
        text: 'Normal', typeInfoLabel: TypeInfoLabel.info,
      )),
      scenario('base_info_hover_simulated', InfoLabel(
        text: 'Hover', typeInfoLabel: TypeInfoLabel.info,
        backgroundColor: const Color(0xFF3498db).withValues(alpha: 0.3),
      )),
      scenario('custom_hover_normal', const InfoLabel(
        text: 'Normal', typeInfoLabel: TypeInfoLabel.success,
      )),
      scenario('custom_hover_simulated', InfoLabel(
        text: 'Hover', typeInfoLabel: TypeInfoLabel.success,
        backgroundColor: Colors.green.withValues(alpha: 0.2),
      )),
      scenario('compact_normal', const InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.info, compactSize: 24,
      )),
      scenario('compact_hover_simulated', InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.info, compactSize: 24,
        backgroundColor: const Color(0xFF3498db).withValues(alpha: 0.3),
      )),
      scenario('globalColor_normal', const InfoLabel(
        text: 'Normal', globalColor: Colors.purple,
      )),
      scenario('globalColor_hover_simulated', InfoLabel(
        text: 'Hover', globalColor: Colors.purple,
        backgroundColor: Colors.purple.withValues(alpha: 0.3),
      )),
      scenario('error_normal', const InfoLabel(
        text: 'Normal', typeInfoLabel: TypeInfoLabel.error,
      )),
      scenario('error_hover_simulated', InfoLabel(
        text: 'Hover', typeInfoLabel: TypeInfoLabel.error,
        backgroundColor: const Color(0xFFe74c3c).withValues(alpha: 0.3),
      )),
    ],
    groupName: 'HOVER_STATES',
    goldenName: 'Normal vs hover state visual comparison',
    fileName: 'golden_hover',
    columns: 2,
  );
}
