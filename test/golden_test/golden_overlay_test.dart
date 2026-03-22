// Overlay indicator — 4 modes: dot, badge, text-only, badge with border.
// Also tests: adaptive pill shape for multi-char text, positions, contexts.
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  // --- Mode 1: Dot (color only, no text) ---
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
      scenario('dot_orange', const InfoLabel(
        text: 'Away', typeInfoLabel: TypeInfoLabel.warning,
        overlayColor: Colors.orange, overlaySize: 10,
        overlayTop: 2, overlayRight: 2,
      )),
    ],
    groupName: 'OVERLAY_DOTS',
    goldenName: 'Overlay mode: dot (color only)',
    fileName: 'golden_overlay_dots',
    columns: 3,
    fixedWidth: 180,
  );

  // --- Mode 2: Badge (color + text) ---
  runGoldenTest(
    [
      scenario('badge_3', const InfoLabel(
        text: 'Inbox', typeInfoLabel: TypeInfoLabel.info,
        overlayColor: Colors.red, overlaySize: 20, overlayText: '3',
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('badge_12', const InfoLabel(
        text: 'Alerts', typeInfoLabel: TypeInfoLabel.warning,
        overlayColor: Colors.red, overlaySize: 20, overlayText: '12',
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('badge_99plus', const InfoLabel(
        text: 'Notifications', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.red, overlaySize: 20, overlayText: '99+',
        overlayTop: 2, overlayRight: 2,
      )),
    ],
    groupName: 'OVERLAY_BADGES',
    goldenName: 'Overlay mode: badge (color + text)',
    fileName: 'golden_overlay_badges',
    columns: 3,
    fixedWidth: 200,
  );

  // --- Mode 3: Text only (no background circle) ---
  runGoldenTest(
    [
      scenario('text_number', const InfoLabel(
        text: 'Tasks', typeInfoLabel: TypeInfoLabel.info,
        overlayText: '5', overlayTextColor: Colors.red, overlaySize: 16,
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('text_letter', const InfoLabel(
        text: 'Priority', typeInfoLabel: TypeInfoLabel.neutral,
        overlayText: 'A', overlayTextColor: Colors.deepOrange, overlaySize: 16,
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('text_symbol', const InfoLabel(
        text: 'New', typeInfoLabel: TypeInfoLabel.success,
        overlayText: '!', overlayTextColor: Colors.red, overlaySize: 16,
        overlayTop: 2, overlayRight: 2,
      )),
    ],
    groupName: 'OVERLAY_TEXT_ONLY',
    goldenName: 'Overlay mode: text only (no background)',
    fileName: 'golden_overlay_text_only',
    columns: 3,
    fixedWidth: 180,
  );

  // --- Mode 4: Badge with border ---
  runGoldenTest(
    [
      scenario('bordered_badge', const InfoLabel(
        text: 'Chat', typeInfoLabel: TypeInfoLabel.info,
        overlayColor: Colors.white, overlayBorderColor: Colors.red,
        overlayText: '3', overlayTextColor: Colors.red, overlaySize: 20,
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('bordered_dot', const InfoLabel(
        text: 'Status', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.green, overlayBorderColor: Colors.white,
        overlaySize: 12,
        overlayTop: 2, overlayRight: 2,
      )),
    ],
    groupName: 'OVERLAY_BORDERED',
    goldenName: 'Overlay mode: badge with border',
    fileName: 'golden_overlay_bordered',
    columns: 2,
    fixedWidth: 180,
  );

  // --- Positions (4 corners) ---
  runGoldenTest(
    [
      scenario('topLeft', const InfoLabel(
        text: 'TL', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.red, overlaySize: 14, overlayText: '1',
        overlayTop: 3, overlayRight: null, overlayLeft: 3,
      )),
      scenario('topRight', const InfoLabel(
        text: 'TR', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.blue, overlaySize: 14, overlayText: '2',
        overlayTop: 3, overlayRight: 3,
      )),
      scenario('bottomLeft', const InfoLabel(
        text: 'BL', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.green, overlaySize: 14, overlayText: '3',
        overlayTop: null, overlayRight: null,
        overlayBottom: 3, overlayLeft: 3,
      )),
      scenario('bottomRight', const InfoLabel(
        text: 'BR', typeInfoLabel: TypeInfoLabel.neutral,
        overlayColor: Colors.orange, overlaySize: 14, overlayText: '4',
        overlayTop: null, overlayRight: 3, overlayBottom: 3,
      )),
    ],
    groupName: 'OVERLAY_POSITIONS',
    goldenName: 'Overlay at all 4 corner positions',
    fileName: 'golden_overlay_positions',
    columns: 2,
    fixedWidth: 160,
  );

  // --- On compact and base with icons ---
  runGoldenTest(
    [
      scenario('on_compact_badge', const InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.info,
        compactSize: 32, overlayColor: Colors.red,
        overlaySize: 16, overlayText: '3',
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('on_compact_dot', const InfoLabel(
        text: 'N', typeInfoLabel: TypeInfoLabel.error,
        compactSize: 32, overlayColor: Colors.green, overlaySize: 10,
        overlayTop: 2, overlayRight: 2,
      )),
      scenario('on_base_with_icon', const InfoLabel(
        text: 'Chat', typeInfoLabel: TypeInfoLabel.info,
        leftIcon: Icon(Icons.chat, size: 16),
        overlayColor: Colors.red, overlaySize: 18, overlayText: '7',
        overlayTop: 2, overlayRight: 2,
      )),
    ],
    groupName: 'OVERLAY_CONTEXTS',
    goldenName: 'Overlay on compact and base with icons',
    fileName: 'golden_overlay_contexts',
    columns: 3,
    fixedWidth: 180,
  );
}
