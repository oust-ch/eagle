import 'package:flutter/material.dart';
import 'package:eagle/src/shared/styles.dart';

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
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius)));
  }
}
