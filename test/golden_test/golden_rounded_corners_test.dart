// Corner radius variations.
// Validates roundedCorners at different values (0–20) for both
// standard circular arcs and iOS-style smooth corners (squircle).
// Each radius is shown twice: standard vs smooth, for direct comparison.
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  // --- Standard circular corners ---
  runGoldenTest(
    [
      for (final radius in [0.0, 3.0, 8.0, 12.0, 20.0])
        scenario(
          'circular_${radius.toInt()}',
          InfoLabel(
            text: 'R${radius.toInt()}',
            typeInfoLabel: TypeInfoLabel.info,
            typeColor: TypeDistributionColor.solid,
            contrastLevel: 1.0,
            roundedCorners: radius,
          ),
        ),
    ],
    groupName: 'ROUNDED_CORNERS_CIRCULAR',
    goldenName: 'Standard circular corners (0–20)',
    fileName: 'golden_corners_circular',
    columns: 5,
  );

  // --- iOS smooth corners (squircle) ---
  runGoldenTest(
    [
      for (final radius in [0.0, 3.0, 8.0, 12.0, 20.0])
        scenario(
          'smooth_${radius.toInt()}',
          InfoLabel(
            text: 'R${radius.toInt()}',
            typeInfoLabel: TypeInfoLabel.info,
            typeColor: TypeDistributionColor.solid,
            contrastLevel: 1.0,
            roundedCorners: radius,
            smoothCorners: true,
          ),
        ),
    ],
    groupName: 'ROUNDED_CORNERS_SMOOTH',
    goldenName: 'iOS smooth corners squircle (0–20)',
    fileName: 'golden_corners_smooth',
    columns: 5,
  );

  // --- Side-by-side comparison at radius 12 (most visible difference) ---
  runGoldenTest(
    [
      scenario('circular_r12', const InfoLabel(
        text: 'Circular',
        typeInfoLabel: TypeInfoLabel.info,
        typeColor: TypeDistributionColor.solid,
        contrastLevel: 1.0,
        roundedCorners: 12,
      )),
      scenario('smooth_r12', const InfoLabel(
        text: 'Smooth',
        typeInfoLabel: TypeInfoLabel.info,
        typeColor: TypeDistributionColor.solid,
        contrastLevel: 1.0,
        roundedCorners: 12,
        smoothCorners: true,
      )),
      scenario('circular_r20', const InfoLabel(
        text: 'Circular',
        typeInfoLabel: TypeInfoLabel.error,
        typeColor: TypeDistributionColor.solid,
        contrastLevel: 1.0,
        roundedCorners: 20,
      )),
      scenario('smooth_r20', const InfoLabel(
        text: 'Smooth',
        typeInfoLabel: TypeInfoLabel.error,
        typeColor: TypeDistributionColor.solid,
        contrastLevel: 1.0,
        roundedCorners: 20,
        smoothCorners: true,
      )),
      scenario('circular_compact', const InfoLabel(
        text: 'S',
        typeInfoLabel: TypeInfoLabel.success,
        compactSize: 32,
        roundedCorners: 10,
      )),
      scenario('smooth_compact', const InfoLabel(
        text: 'S',
        typeInfoLabel: TypeInfoLabel.success,
        compactSize: 32,
        roundedCorners: 10,
        smoothCorners: true,
      )),
    ],
    groupName: 'CORNERS_COMPARISON',
    goldenName: 'Circular vs smooth side-by-side',
    fileName: 'golden_corners_comparison',
    columns: 2,
  );
}
