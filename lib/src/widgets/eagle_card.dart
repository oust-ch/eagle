import 'package:flutter/material.dart';
import 'package:eagle/src/shared/styles.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class EagleCard extends StatelessWidget {
  final Widget child;
  EdgeInsetsGeometry padding;

  EagleCard({required this.child, this.padding = const EdgeInsets.all(16)});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(child: child, padding: padding),
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: TWTwoColors.blueGray.shade100),
            borderRadius: BorderRadius.circular(defaultRadius)));
  }
}
