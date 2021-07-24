import 'package:eagle/eagle.dart';
import 'package:eagle/src/shared/styles.dart';
import 'package:flutter/material.dart';

enum EagleButtonType { primary, secondary, tertiary }

class EagleButton extends StatelessWidget {
  final String text;
  final EagleButtonType type;
  final bool busy;
  final void Function()? onPressed;
  final IconData? leading;
  final IconData? trailing;

  const EagleButton(
      {required this.text,
      this.type = EagleButtonType.primary,
      this.busy = false,
      this.onPressed,
      this.leading,
      this.trailing});

  Color _color() {
    switch (type) {
      case EagleButtonType.primary:
        return EagleColors.oustBlendMain;
      case EagleButtonType.secondary:
        return EagleColors.oustBlendSurface;
      case EagleButtonType.tertiary:
        return Colors.transparent;
    }
  }

  Color _textColor() {
    switch (type) {
      case EagleButtonType.primary:
        return Colors.white;
      case EagleButtonType.secondary:
        return EagleColors.oustBlendMain;
      case EagleButtonType.tertiary:
        return EagleColors.oustBlendMain;
    }
  }

  Color _hoverColor() {
    switch (type) {
      case EagleButtonType.primary:
        return EagleColors.oustBlendHover;
      case EagleButtonType.secondary:
        return EagleColors.oustBlendBorder;
      case EagleButtonType.tertiary:
        return EagleColors.oustBlendBorder;
    }
  }

  Color _highlightColor() {
    switch (type) {
      case EagleButtonType.primary:
        return EagleColors.oustBlendPressed;
      case EagleButtonType.secondary:
        return EagleColors.oustBlendBorder;
      case EagleButtonType.tertiary:
        return EagleColors.oustBlendBorder;
    }
  }

  BorderSide _side() {
    switch (type) {
      case EagleButtonType.primary:
        return BorderSide.none;
      case EagleButtonType.secondary:
        return BorderSide(color: EagleColors.oustBlendBorder);
      case EagleButtonType.tertiary:
        return BorderSide.none;
    }
  }

  @override
  Widget build(BuildContext context) {
    return EagleBaseButton(
        text: text,
        busy: busy,
        onPressed: onPressed,
        leading: leading,
        trailing: trailing,
        color: _color(),
        textColor: _textColor(),
        hoverColor: _hoverColor(),
        highlightColor: _highlightColor(),
        side: _side());
  }
}

class EagleBaseButton extends StatelessWidget {
  final String text;
  final bool busy;
  final void Function()? onPressed;
  final IconData? leading;
  final IconData? trailing;

  final Color color;
  final Color textColor;
  final Color hoverColor;
  final Color highlightColor;
  final BorderSide side;

  const EagleBaseButton(
      {required this.text,
      required this.color,
      required this.textColor,
      required this.hoverColor,
      required this.highlightColor,
      required this.side,
      this.busy = false,
      this.onPressed,
      this.leading,
      this.trailing});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        onPressed: onPressed,
        color: color,
        hoverColor: hoverColor,
        highlightColor: highlightColor,
        splashColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            side: side, borderRadius: BorderRadius.circular(defaultRadius)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: busy
              ? SizedBox(
                  height: 17,
                  width: 17,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(textColor),
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (leading != null) ...[
                      Icon(leading!, color: textColor, size: 16),
                      SizedBox(width: 8)
                    ],
                    EagleText.textM(text,
                        bold: true, selectable: false, color: textColor),
                    if (trailing != null) ...[
                      SizedBox(width: 8),
                      Icon(trailing!, color: textColor, size: 16)
                    ],
                  ],
                ),
        ));
  }
}
