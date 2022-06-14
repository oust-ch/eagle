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
                                disableIfNoConnection: true,
                                color: k.options(
                                    label: 'Color',
                                    initial: EagleButtonColor.brand,
                                    options: EagleButtonColor.values
                                        .map((x) => Option(x.toString(), x))
                                        .toList()),
                                disabled: k.boolean(label: 'Disabled'),
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
                                disableIfNoConnection: true,
                                color: k.options(
                                    label: 'Color',
                                    initial: EagleButtonColor.brand,
                                    options: EagleButtonColor.values
                                        .map((x) => Option(x.toString(), x))
                                        .toList()),
                                onPressed: () {},
                                disabled: k.boolean(label: 'Disabled'),
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
                                disableIfNoConnection: true,
                                color: k.options(
                                    label: 'Color',
                                    initial: EagleButtonColor.brand,
                                    options: EagleButtonColor.values
                                        .map((x) => Option(x.toString(), x))
                                        .toList()),
                                onPressed: () {},
                                disabled: k.boolean(label: 'Disabled'),
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
                      squared: k.boolean(label: 'Squared', initial: false),
                      text: k.text(label: 'Badge content', initial: 'Hello'))),
              Story(
                  name: 'Card',
                  builder: (_, k) => EagleCard(
                      child: Text(k.text(
                          label: 'Card content',
                          initial:
                              'Maecenas faucibus quam elit, quis dictum leo aliquet sed. Cras ornare porttitor dolor, et fringilla magna consectetur non. Pellentesque at nisi lobortis, iaculis dui ut, condimentum nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis nec leo id interdum. Mauris vestibulum quam vel lacus lacinia pharetra. Phasellus luctus tristique ex, eu efficitur metus dignissim eu. Duis gravida pulvinar neque, sit amet sollicitudin nulla egestas ac. Cras sed urna at lorem ornare dapibus vestibulum feugiat arcu. In venenatis dolor dignissim sollicitudin fermentum.')))),
              Story(
                  name: 'Selectable',
                  builder: (_, k) => EagleSelectableItem(
                      selected: k.boolean(label: 'Selected', initial: false),
                      onPressed: () {},
                      child: Text(
                          'Maecenas faucibus quam elit, quis dictum leo aliquet sed. Cras ornare porttitor dolor, et fringilla magna consectetur non. Pellentesque at nisi lobortis, iaculis dui ut, condimentum nibh. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis mattis nec leo id interdum. Mauris vestibulum quam vel lacus lacinia pharetra. Phasellus luctus tristique ex, eu efficitur metus dignissim eu. Duis gravida pulvinar neque, sit amet sollicitudin nulla egestas ac. Cras sed urna at lorem ornare dapibus vestibulum feugiat arcu. In venenatis dolor dignissim sollicitudin fermentum.'))),
            ],
          ),
        ),
      );
}
