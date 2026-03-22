// TypeInfoLabel color rendering.
// Validates that each of the 13 TypeInfoLabel values produces the
// correct color when rendered with solid distribution (contrastLevel: 1.0).
// Also validates that globalColor overrides type-based colors.
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  // --- Pure type colors (solid, contrast 1.0) ---
  runGoldenTest(
    [
      for (final type in TypeInfoLabel.values)
        scenario(
          '${type.name}_solid',
          InfoLabel(
            text: type.name,
            typeInfoLabel: type,
            typeColor: TypeDistributionColor.solid,
            contrastLevel: 1.0,
          ),
        ),
    ],
    groupName: 'TYPE_COLORS',
    goldenName: 'All 13 TypeInfoLabel solid colors',
    fileName: 'golden_type_colors_solid',
    columns: 4,
  );

  // --- GlobalColor override (teal overrides all type colors) ---
  runGoldenTest(
    [
      for (final type in TypeInfoLabel.values)
        scenario(
          '${type.name}_globalColor_teal',
          InfoLabel(
            text: type.name,
            typeInfoLabel: type,
            globalColor: Colors.teal,
            typeColor: TypeDistributionColor.solid,
            contrastLevel: 1.0,
          ),
        ),
    ],
    groupName: 'TYPE_COLORS_GLOBAL_OVERRIDE',
    goldenName: 'All 13 TypeInfoLabel with globalColor teal',
    fileName: 'golden_type_colors_global_override',
    columns: 4,
  );
}
