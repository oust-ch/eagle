import 'package:eagle/eagle.dart';
import 'package:example/utils.dart';
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
                  name: 'Buttons',
                  builder: (_, k) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            EagleButton(
                                type: EagleButtonType.primary,
                                onPressed: () {},
                                leading: k.options(
                                    label: 'Leading icon',
                                    initial: null,
                                    options: exampleIcons),
                                trailing: k.options(
                                    label: 'Trailing icon',
                                    initial: null,
                                    options: exampleIcons),
                                busy: k.boolean(label: 'Busy'),
                                text: k.text(
                                    label: 'Button text', initial: 'Button')),
                            SizedBox(height: 8),
                            EagleButton(
                                type: EagleButtonType.secondary,
                                onPressed: () {},
                                leading: k.options(
                                    label: 'Leading icon',
                                    initial: null,
                                    options: exampleIcons),
                                trailing: k.options(
                                    label: 'Trailing icon',
                                    initial: null,
                                    options: exampleIcons),
                                busy: k.boolean(label: 'Busy'),
                                text: k.text(
                                    label: 'Button text', initial: 'Button')),
                            SizedBox(height: 8),
                            EagleButton(
                                type: EagleButtonType.tertiary,
                                onPressed: () {},
                                leading: k.options(
                                    label: 'Leading icon',
                                    initial: null,
                                    options: exampleIcons),
                                trailing: k.options(
                                    label: 'Trailing icon',
                                    initial: null,
                                    options: exampleIcons),
                                busy: k.boolean(label: 'Busy'),
                                text: k.text(
                                    label: 'Button text', initial: 'Button')),
                          ],
                        ),
                      )),
              Story(
                  name: 'Card',
                  builder: (_, k) => EagleCard(
                      child: Text(
                          k.text(label: 'Card content', initial: 'Hello')))),
              Story(
                  name: 'Badge',
                  builder: (_, k) => EagleBadge(
                      color: k.options(
                          label: 'Color',
                          initial: EagleBadgeColor.green,
                          options: EagleBadgeColor.values
                              .map((x) =>
                                  Option<EagleBadgeColor>(x.toString(), x))
                              .toList()),
                      bold: k.boolean(label: 'Bold', initial: false),
                      text: k.text(label: 'Badge content', initial: 'Hello'))),
            ],
          ),
        ),
      );
}
