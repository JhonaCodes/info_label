// Layout, icons, alignment, padding, and message.
// Validates content positioning: left/right icons, msg widget,
// mainAxisAlignment, crossAxisAlignment, padding variations.
import 'package:flutter/material.dart';
import 'package:info_label/info_label.dart';

import 'config.dart';

void main() {
  runGoldenTest(
    [
      scenario('text_only', const InfoLabel(
        text: 'Text Only', typeInfoLabel: TypeInfoLabel.info,
      )),
      scenario('left_icon_only', const InfoLabel(
        text: 'Left Icon', typeInfoLabel: TypeInfoLabel.info,
        leftIcon: Icon(Icons.info_outline, size: 16),
      )),
      scenario('right_icon_only', const InfoLabel(
        text: 'Right Icon', typeInfoLabel: TypeInfoLabel.info,
        rightIcon: Icon(Icons.arrow_forward, size: 16),
      )),
      scenario('both_icons', const InfoLabel(
        text: 'Both Icons', typeInfoLabel: TypeInfoLabel.info,
        leftIcon: Icon(Icons.star, size: 16),
        rightIcon: Icon(Icons.chevron_right, size: 16),
      )),
      scenario('text_with_msg', const InfoLabel(
        text: 'Title', typeInfoLabel: TypeInfoLabel.neutral,
        msg: Text('Message below the title'),
      )),
      scenario('msg_only_no_text', const InfoLabel(
        typeInfoLabel: TypeInfoLabel.neutral,
        msg: Text('Message as primary content'),
      )),
      scenario('icons_text_msg', const InfoLabel(
        text: 'Full Layout', typeInfoLabel: TypeInfoLabel.success,
        leftIcon: Icon(Icons.check, size: 16),
        rightIcon: Icon(Icons.close, size: 16),
        msg: Text('With icons and message'),
      )),
      scenario('alignment_start', const InfoLabel(
        text: 'Start', typeInfoLabel: TypeInfoLabel.info,
        leftIcon: Icon(Icons.arrow_back, size: 16),
        mainAxisAlignment: MainAxisAlignment.start,
      )),
      scenario('alignment_spaceBetween', const InfoLabel(
        text: 'Space Between', typeInfoLabel: TypeInfoLabel.info,
        leftIcon: Icon(Icons.menu, size: 16),
        rightIcon: Icon(Icons.more_vert, size: 16),
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        isTextAdaptive: false,
      )),
      scenario('custom_text_padding', const InfoLabel(
        text: 'Padded', typeInfoLabel: TypeInfoLabel.info,
        textPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      )),
      scenario('custom_icon_padding', const InfoLabel(
        text: 'Icon Padding', typeInfoLabel: TypeInfoLabel.info,
        leftIcon: Icon(Icons.star, size: 16),
        rightIcon: Icon(Icons.star, size: 16),
        leftIconPadding: EdgeInsets.all(8),
        rightIconPadding: EdgeInsets.all(8),
      )),
      scenario('custom_msg_padding', const InfoLabel(
        text: 'Title', typeInfoLabel: TypeInfoLabel.info,
        msg: Text('Message with custom padding'),
        msgPadding: EdgeInsets.all(12),
      )),
    ],
    groupName: 'LAYOUT_ICONS',
    goldenName: 'Layout, icons, alignment, and padding',
    fileName: 'golden_layout_icons',
    columns: 3,
    fixedWidth: 250,
  );
}
