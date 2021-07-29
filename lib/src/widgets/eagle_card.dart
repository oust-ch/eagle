import 'package:flutter/material.dart';
import 'package:eagle/src/shared/styles.dart';

const blueGray200 = Color(0xffe2e8f0);

class EagleCard extends StatelessWidget {
  final Widget child;
  Color borderColor;
  EdgeInsetsGeometry padding;

  EagleCard(
      {required this.child,
      this.padding = const EdgeInsets.all(16),
      this.borderColor = blueGray200});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(child: child, padding: padding),
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(defaultRadius)));
  }
}
