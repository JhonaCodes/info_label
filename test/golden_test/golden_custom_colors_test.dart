// Custom color overrides (text, background, global).
// Validates that explicit textColor, backgroundColor, and globalColor
// override type-based defaults correctly.
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  runGoldenTest(
    [
      scenario('black_on_yellow', const InfoLabel(
        text: 'High Contrast', typeInfoLabel: TypeInfoLabel.none,
        textColor: Colors.black, backgroundColor: Colors.yellow, borderColor: Colors.orange,
      )),
      scenario('white_on_indigo', const InfoLabel(
        text: 'Dark Background', typeInfoLabel: TypeInfoLabel.none,
        textColor: Colors.white, backgroundColor: Colors.indigo, borderColor: Colors.indigoAccent,
      )),
      scenario('green_on_white', const InfoLabel(
        text: 'Light Background', typeInfoLabel: TypeInfoLabel.none,
        textColor: Colors.green, backgroundColor: Colors.white, borderColor: Colors.green,
      )),
      scenario('globalColor_indigo_low', const InfoLabel(
        text: 'Low Contrast', typeInfoLabel: TypeInfoLabel.none,
        globalColor: Colors.indigo, contrastLevel: 0.2,
      )),
      scenario('globalColor_indigo_high', const InfoLabel(
        text: 'High Contrast', typeInfoLabel: TypeInfoLabel.none,
        globalColor: Colors.indigo, contrastLevel: 0.8,
      )),
      scenario('globalColor_overrides_type', const InfoLabel(
        text: 'Global Wins', typeInfoLabel: TypeInfoLabel.error,
        globalColor: Colors.teal, typeColor: TypeDistributionColor.solid, contrastLevel: 1.0,
      )),
    ],
    groupName: 'CUSTOM_COLORS',
    goldenName: 'Custom color overrides and globalColor',
    fileName: 'golden_custom_colors',
    columns: 3,
  );
}
