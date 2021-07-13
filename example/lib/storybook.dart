import 'package:eagle/eagle.dart';
import 'package:flutter/material.dart';
import 'package:storybook_flutter/storybook_flutter.dart';

class StoryBook extends StatelessWidget {
  const StoryBook({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: CustomStorybook(
            builder: (context) => Row(
              children: [
                SizedBox(
                  width: 200,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      color: Theme.of(context).cardColor,
                    ),
                    child: const Contents(),
                  ),
                ),
                const Expanded(child: CurrentStory()),
                const SizedBox(width: 200, child: KnobPanel()),
              ],
            ),
            children: [
              Story(
                  section: 'Typography',
                  name: 'Header One',
                  builder: (_, k) => EagleText.header1(
                      k.text(label: 'Text', initial: 'Header 1'))),
              Story(
                  section: 'Typography',
                  name: 'Header Two',
                  builder: (_, k) => EagleText.header2(
                      k.text(label: 'Text', initial: 'Header 2')))
            ],
          ),
        ),
      );
}
