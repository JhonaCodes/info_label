// Border color and visibility.
// Validates border rendering with different colors,
// transparent borders, and type-based borders.
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  runGoldenTest(
    [
      scenario(
        'border_red',
        const InfoLabel(
          text: 'Red Border',
          typeInfoLabel: TypeInfoLabel.none,
          borderColor: Colors.red,
          backgroundColor: Colors.white,
          textColor: Colors.red,
        ),
      ),
      scenario(
        'border_blue',
        const InfoLabel(
          text: 'Blue Border',
          typeInfoLabel: TypeInfoLabel.none,
          borderColor: Colors.blue,
          backgroundColor: Colors.white,
          textColor: Colors.blue,
        ),
      ),
      scenario(
        'border_transparent',
        const InfoLabel(
          text: 'No Border',
          typeInfoLabel: TypeInfoLabel.none,
          borderColor: Colors.transparent,
          backgroundColor: Colors.blueGrey,
          textColor: Colors.white,
        ),
      ),
      scenario(
        'border_from_type_success',
        const InfoLabel(
          text: 'Type Border',
          typeInfoLabel: TypeInfoLabel.success,
          typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
          contrastLevel: 0.2,
        ),
      ),
      scenario(
        'border_from_type_error',
        const InfoLabel(
          text: 'Type Border',
          typeInfoLabel: TypeInfoLabel.error,
          typeColor: TypeDistributionColor.solidBorderTextContrastBackground,
          contrastLevel: 0.2,
        ),
      ),
    ],
    groupName: 'BORDER_COLORS',
    goldenName: 'Border color and visibility variations',
    fileName: 'golden_border_colors',
    columns: 3,
  );
}
