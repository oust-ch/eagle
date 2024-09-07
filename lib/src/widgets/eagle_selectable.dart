import 'package:eagle/eagle.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

class EagleSelectableItem extends StatefulWidget {
  const EagleSelectableItem({
    super.key,
    this.selected = false,
    this.padding = const EdgeInsets.all(8),
    this.onPressed,
    this.showIcons = true,
    required this.child,
  });

  final VoidCallback? onPressed;
  final Widget child;
  final bool selected;
  final EdgeInsetsGeometry padding;
  final bool showIcons;

  @override
  State<EagleSelectableItem> createState() => _EagleSelectableItemState();
}

class _EagleSelectableItemState extends State<EagleSelectableItem> {
  bool _focused = false;
  bool _hovering = false;
  late final Map<Type, Action<Intent>> _actionMap;
  final Map<ShortcutActivator, Intent> _shortcutMap =
      const <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.keyX): ActivateIntent(),
  };

  @override
  void initState() {
    super.initState();
    _actionMap = <Type, Action<Intent>>{
      ActivateIntent: CallbackAction<Intent>(
        onInvoke: (Intent intent) => _toggleState(),
      ),
    };
  }

  Color get color {
    Color baseColor = Colors.white;
    if (_focused) {
      baseColor = TWTwoColors.blueGray.shade100;
    }
    if (_hovering) {
      baseColor = TWTwoColors.blueGray.shade50!;
    }
    return baseColor;
  }

  void _toggleState() {
    if (widget.onPressed != null) {
      widget.onPressed!();
    }
  }

  void _handleFocusHighlight(bool value) {
    setState(() {
      _focused = value;
    });
  }

  void _handleHoveHighlight(bool value) {
    setState(() {
      _hovering = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleState,
      child: FocusableActionDetector(
        actions: _actionMap,
        shortcuts: _shortcutMap,
        onShowFocusHighlight: _handleFocusHighlight,
        onShowHoverHighlight: _handleHoveHighlight,
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            gradient: widget.selected
                ? EagleColors.oustGradient
                : LinearGradient(colors: [color, color]),
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Container(
              padding: widget.padding,
              decoration: BoxDecoration(
                color: color,
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(defaultRadius - 2),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Row(
                      children: [
                        if (widget.showIcons && !widget.selected) ...[
                          const Icon(Icons.chevron_right,
                              color: EagleColors.oustBlendMain),
                          EagleSpacing.horiz2,
                        ],
                        Flexible(child: widget.child),
                      ],
                    ),
                  ),
                  if (widget.showIcons && widget.selected) ...[
                    EagleSpacing.horiz2,
                    Icon(Icons.close, color: TWTwoColors.blueGray.shade600),
                  ]
                ],
              )),
        ),
      ),
    );
  }
}
