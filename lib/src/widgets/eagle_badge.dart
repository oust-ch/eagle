import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

import 'eagle_text.dart';

enum EagleBadgeColor { green, red, cyan, gray }

class EagleBadge extends StatelessWidget {
  final EagleBadgeColor color;
  final String text;
  final bool bold;
  final bool squared;

  EagleBadge(
      {required this.text,
      this.color = EagleBadgeColor.green,
      this.bold = false,
      this.squared = false});

  Color _backgroundColor() {
    switch (color) {
      case EagleBadgeColor.green:
        return TWTwoColors.green.shade100;
      case EagleBadgeColor.cyan:
        return TWTwoColors.cyan.shade100;
      case EagleBadgeColor.red:
        return TWTwoColors.red.shade100;
      case EagleBadgeColor.gray:
        return TWTwoColors.blueGray.shade200;
    }
  }

  Color _color() {
    switch (color) {
      case EagleBadgeColor.green:
        return TWTwoColors.green.shade800;
      case EagleBadgeColor.cyan:
        return TWTwoColors.cyan.shade800;
      case EagleBadgeColor.red:
        return TWTwoColors.red.shade800;
      case EagleBadgeColor.gray:
        return TWTwoColors.blueGray.shade900;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
            color: _backgroundColor(),
            borderRadius: BorderRadius.all(Radius.circular(squared ? 4 : 40))),
        child: EagleText.textS(
          text,
          bold: bold,
          color: _color(),
          selectable: false,
        ));
  }
}
