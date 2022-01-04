import 'package:flutter/material.dart';
import 'package:eagle/src/shared/styles.dart';

const blueGray200 = Color(0xffcbd5e1);

class EagleCard extends StatelessWidget {
  final Widget child;
  void Function()? onTap;
  Color borderColor;
  EdgeInsetsGeometry padding;

  EagleCard(
      {required this.child,
      this.onTap,
      this.padding = const EdgeInsets.all(16),
      this.borderColor = blueGray200});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            child: InkWell(
                child: child,
                onTap: onTap,
                borderRadius: BorderRadius.circular(8)),
            padding: padding),
        color: Colors.white,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(defaultRadius)));
  }
}
