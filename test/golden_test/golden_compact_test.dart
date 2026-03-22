// Compact mode (compactSize).
// Validates fixed-size square label rendering: text centering,
// auto-scaling for long text, different sizes, titleWidget fallback,
// corner radius in compact, and type color in compact.
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  runGoldenTest(
    [
      scenario('compact_16_S', const InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.info, compactSize: 16,
      )),
      scenario('compact_24_S', const InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.info, compactSize: 24,
      )),
      scenario('compact_32_S', const InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.info, compactSize: 32,
      )),
      scenario('compact_48_S', const InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.info, compactSize: 48,
      )),
      scenario('compact_24_AB', const InfoLabel(
        text: 'AB', typeInfoLabel: TypeInfoLabel.info, compactSize: 24,
      )),
      scenario('compact_24_99plus', const InfoLabel(
        text: '99+', typeInfoLabel: TypeInfoLabel.error, compactSize: 24,
      )),
      scenario('compact_24_titleWidget_icon', const InfoLabel(
        titleWidget: Icon(Icons.star, size: 14),
        typeInfoLabel: TypeInfoLabel.warning, compactSize: 24,
      )),
      scenario('compact_24_success', const InfoLabel(
        text: 'S', typeInfoLabel: TypeInfoLabel.success, compactSize: 24,
      )),
      scenario('compact_24_error', const InfoLabel(
        text: 'E', typeInfoLabel: TypeInfoLabel.error, compactSize: 24,
      )),
      scenario('compact_24_critical', const InfoLabel(
        text: '!', typeInfoLabel: TypeInfoLabel.critical, compactSize: 24,
      )),
      scenario('compact_24_pill', const InfoLabel(
        text: 'P', typeInfoLabel: TypeInfoLabel.info,
        compactSize: 24, roundedCorners: 12,
      )),
      scenario('compact_24_square', const InfoLabel(
        text: 'Q', typeInfoLabel: TypeInfoLabel.info,
        compactSize: 24, roundedCorners: 0,
      )),
    ],
    groupName: 'COMPACT_MODE',
    goldenName: 'Compact mode sizing and text scaling',
    fileName: 'golden_compact',
    columns: 4,
  );
}
