import 'package:eagle/eagle.dart';
import 'package:flutter/material.dart';

class ExampleView extends StatelessWidget {
  const ExampleView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 30),
      children: [
        EagleText.header1('Design System'),
        Divider(),
        ...textWidgets,
      ],
    );
  }

  List<Widget> get textWidgets => [
        EagleText.header1('Header / 1', gradient: true),
        EagleText.header2('Header / 2'),
        EagleText.header3('Header / 3'),
        EagleText.header4('Header / 4'),
        Divider(),
        EagleText.subtitle1('Subtitle / 1'),
        EagleText.subtitle2('Subtitle / 2'),
        Divider(),
        EagleText.textM('Text M'),
        EagleText.textM('Text M Bold', bold: true),
        Divider(),
        EagleText.textS('Text S'),
        EagleText.textS('Text S Bold', bold: true),
      ];
}
