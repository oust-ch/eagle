import 'package:example/storybook.dart';
import 'package:flutter/material.dart';

import 'example_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  List<Widget> tabs = [ExampleView(), StoryBook()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eagle Design System',
      home: Scaffold(
        body: tabs.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'List'),
            BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Storybook')
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
