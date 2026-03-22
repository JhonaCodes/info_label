// Overlay indicator (overlayColor, overlayText, positions).
// Validates the painted circle overlay: color, size, text content,
// positioning at all four corners, and overlay on compact/base labels.
//
// Uses positive positions (2–4) so overlays stay INSIDE widget bounds
// and are fully visible in the golden output. Sizes are large enough
// to be clearly distinguishable at golden test resolution.
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  // --- Dots and badges ---
  runGoldenTest(
    [
      scenario('dot_red', const InfoLabel(
        text: 'Messages', typeInfoLabel: TypeInfoLabel.info,
        overlayColor: Colors.red, overlaySize: 10,
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('dot_green', const InfoLabel(
        text: 'Online', typeInfoLabel: TypeInfoLabel.success,
        overlayColor: Colors.green, overlaySize: 10,
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('badge_3', const InfoLabel(
        text: 'Inbox', typeInfoLabel: TypeInfoLabel.info,
        overlayColor: Colors.red, overlaySize: 18, overlayText: '3',
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('badge_99', const InfoLabel(
        text: 'Alerts', typeInfoLabel: TypeInfoLabel.warning,
        overlayColor: Colors.red, overlaySize: 22, overlayText: '99',
        overlayTop: 2, overlayRight: 2,
      )),
    ],
    groupName: 'OVERLAY_DOTS_BADGES',
    goldenName: 'Overlay dots and number badges',
    fileName: 'golden_overlay_dots_badges',
    columns: 2,
    fixedWidth: 200,
  );

  // --- Size variations ---
  runGoldenTest(
    [
      scenario('size_8', const InfoLabel(
        text: 'Small', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.orange, overlaySize: 8,
        overlayTop: 3, overlayRight: 3,
      )),
      scenario('size_14', const InfoLabel(
        text: 'Medium', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.orange, overlaySize: 14, overlayText: '5',
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('size_22', const InfoLabel(
        text: 'Large', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.orange, overlaySize: 22, overlayText: '42',
        overlayTop: 2, overlayRight: 2,
      )),
    ],
    groupName: 'OVERLAY_SIZES',
    goldenName: 'Overlay circle size variations',
    fileName: 'golden_overlay_sizes',
    columns: 3,
    fixedWidth: 180,
  );

  // --- On compact and with icons ---
  runGoldenTest(
    [
      scenario('on_compact', const InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.info,
        compactSize: 32, overlayColor: Colors.red,
        overlaySize: 14, overlayText: '3',
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('on_compact_dot', const InfoLabel(
        text: 'N', typeInfoLabel: TypeInfoLabel.error,
        compactSize: 32, overlayColor: Colors.green,
        overlaySize: 10,
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('on_base_with_icon', const InfoLabel(
        text: 'Chat', typeInfoLabel: TypeInfoLabel.info,
        leftIcon: Icon(Icons.chat, size: 16),
        overlayColor: Colors.red, overlaySize: 16, overlayText: '7',
        overlayTop: 2, overlayRight: 2,
      )),
    ],
    groupName: 'OVERLAY_CONTEXTS',
    goldenName: 'Overlay on compact and base with icons',
    fileName: 'golden_overlay_contexts',
    columns: 3,
    fixedWidth: 180,
  );

  // --- Position variations (all 4 corners) ---
  runGoldenTest(
    [
      scenario('topLeft', const InfoLabel(
        text: 'TL', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.red, overlaySize: 12,
        overlayTop: 3, overlayRight: null, overlayLeft: 3,
      )),
      scenario('topRight', const InfoLabel(
        text: 'TR', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.blue, overlaySize: 12,
        overlayTop: 3, overlayRight: 3,
      )),
      scenario('bottomLeft', const InfoLabel(
        text: 'BL', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.green, overlaySize: 12,
        overlayTop: null, overlayRight: null,
        overlayBottom: 3, overlayLeft: 3,
      )),
      scenario('bottomRight', const InfoLabel(
        text: 'BR', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.orange, overlaySize: 12,
        overlayTop: null, overlayRight: 3, overlayBottom: 3,
      )),
    ],
    groupName: 'OVERLAY_POSITIONS',
    goldenName: 'Overlay at all 4 corner positions',
    fileName: 'golden_overlay_positions',
    columns: 2,
    fixedWidth: 160,
  );
}
