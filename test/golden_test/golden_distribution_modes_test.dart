// TypeDistributionColor contrast modes.
// Validates how each of the 6 distribution modes applies contrast
// to text, background, and border. Uses a fixed TypeInfoLabel.info
// to isolate the distribution effect. Tests 3 contrast levels:
// 0.1 (subtle), 0.3 (default), 0.8 (strong).
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  const contrastLevels = [0.1, 0.3, 0.8];

  for (final contrast in contrastLevels) {
    final label = 'contrast_${contrast.toString().replaceAll('.', '_')}';

    runGoldenTest(
      [
        for (final dist in TypeDistributionColor.values)
          scenario(
            '${dist.name}_$label',
            InfoLabel(
              text: dist.name,
              typeInfoLabel: TypeInfoLabel.info,
              typeColor: dist,
              contrastLevel: contrast,
            ),
          ),
      ],
      groupName: 'DISTRIBUTION_MODES_$label',
      goldenName: '6 distribution modes at contrast $contrast',
      fileName: 'golden_distribution_$label',
      columns: 3,
      fixedWidth: 320,
    );
  }
}
