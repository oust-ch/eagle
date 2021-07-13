import 'package:flutter/material.dart';

import 'example_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eagle Design System',
      home: ExampleView(),
      debugShowCheckedModeBanner: false,
    );
  }
}
