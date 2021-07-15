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
                  name: 'Card',
                  builder: (_, k) => EagleCard(
                      child: Text(
                          k.text(label: 'Card content', initial: 'Hello')))),
            ],
          ),
        ),
      );
}
