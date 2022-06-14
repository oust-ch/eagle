import 'package:eagle/eagle.dart';
import 'package:eagle/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:tailwind_colors/tailwind_colors.dart';

enum EagleButtonType { primary, secondary, tertiary }

enum EagleButtonColor { brand, red, orange }

class EagleButton extends StatelessWidget {
  final String text;
  final EagleButtonType type;
  final EagleButtonColor color;
  final bool busy;
  final bool disabled;
  final bool disableIfNoConnection;
  final void Function()? onPressed;
  final IconData? leading;
  final IconData? trailing;
  final EdgeInsetsGeometry padding;

  const EagleButton(
      {required this.text,
      this.type = EagleButtonType.primary,
      this.color = EagleButtonColor.brand,
      this.busy = false,
      this.disabled = false,
      this.disableIfNoConnection = false,
      this.onPressed,
      this.leading,
      this.trailing,
      this.padding = const EdgeInsets.all(8.0)});

  Color _color() {
    switch (color) {
      case EagleButtonColor.brand:
        switch (type) {
          case EagleButtonType.primary:
            return EagleColors.oustBlendMain;
          case EagleButtonType.secondary:
            return EagleColors.oustBlendSurface;
          case EagleButtonType.tertiary:
            return Colors.transparent;
        }
      case EagleButtonColor.red:
        switch (type) {
          case EagleButtonType.primary:
            return TWTwoColors.red.shade500;
          case EagleButtonType.secondary:
            return TWTwoColors.red.shade100;
          case EagleButtonType.tertiary:
            return Colors.transparent;
        }
      case EagleButtonColor.orange:
        switch (type) {
          case EagleButtonType.primary:
            return TWTwoColors.amber.shade500;
          case EagleButtonType.secondary:
            return TWTwoColors.amber.shade100;
          case EagleButtonType.tertiary:
            return Colors.transparent;
        }
    }
  }

  Color _textColor() {
    switch (color) {
      case EagleButtonColor.brand:
        switch (type) {
          case EagleButtonType.primary:
            return Colors.white;
          case EagleButtonType.secondary:
            return EagleColors.oustBlendMain;
          case EagleButtonType.tertiary:
            return EagleColors.oustBlendMain;
        }
      case EagleButtonColor.red:
        switch (type) {
          case EagleButtonType.primary:
            return Colors.white;
          case EagleButtonType.secondary:
            return TWTwoColors.red.shade500;
          case EagleButtonType.tertiary:
            return TWTwoColors.red.shade500;
        }
      case EagleButtonColor.orange:
        switch (type) {
          case EagleButtonType.primary:
            return Colors.white;
          case EagleButtonType.secondary:
            return TWTwoColors.amber.shade500;
          case EagleButtonType.tertiary:
            return TWTwoColors.amber.shade500;
        }
    }
  }

  Color _hoverColor() {
    switch (color) {
      case EagleButtonColor.brand:
        switch (type) {
          case EagleButtonType.primary:
            return EagleColors.oustBlendHover;
          case EagleButtonType.secondary:
            return EagleColors.oustBlendBorder;
          case EagleButtonType.tertiary:
            return EagleColors.oustBlendSurface;
        }
      case EagleButtonColor.red:
        switch (type) {
          case EagleButtonType.primary:
            return TWTwoColors.red.shade700;
          case EagleButtonType.secondary:
            return TWTwoColors.red.shade200;
          case EagleButtonType.tertiary:
            return TWTwoColors.red.shade100;
        }
      case EagleButtonColor.orange:
        switch (type) {
          case EagleButtonType.primary:
            return TWTwoColors.amber.shade700;
          case EagleButtonType.secondary:
            return TWTwoColors.amber.shade200;
          case EagleButtonType.tertiary:
            return TWTwoColors.amber.shade100;
        }
    }
  }

  Color _highlightColor() {
    switch (color) {
      case EagleButtonColor.brand:
        switch (type) {
          case EagleButtonType.primary:
            return EagleColors.oustBlendPressed;
          case EagleButtonType.secondary:
            return EagleColors.oustBlendBorder;
          case EagleButtonType.tertiary:
            return EagleColors.oustBlendBorder;
        }
      case EagleButtonColor.red:
        switch (type) {
          case EagleButtonType.primary:
            return TWTwoColors.red.shade900;
          case EagleButtonType.secondary:
            return TWTwoColors.red.shade300;
          case EagleButtonType.tertiary:
            return TWTwoColors.red.shade200;
        }
      case EagleButtonColor.orange:
        switch (type) {
          case EagleButtonType.primary:
            return TWTwoColors.amber.shade900;
          case EagleButtonType.secondary:
            return TWTwoColors.amber.shade300;
          case EagleButtonType.tertiary:
            return TWTwoColors.amber.shade200;
        }
    }
  }

  Color _disabledColor() {
    switch (type) {
      case EagleButtonType.primary:
        return TWTwoColors.blueGray.shade300;
      case EagleButtonType.secondary:
        return TWTwoColors.blueGray.shade100;
      case EagleButtonType.tertiary:
        return Colors.transparent;
    }
  }

  Color _disabledTextColor() {
    switch (type) {
      case EagleButtonType.primary:
        return Colors.white;
      case EagleButtonType.secondary:
        return TWTwoColors.blueGray.shade300;
      case EagleButtonType.tertiary:
        return TWTwoColors.blueGray.shade300;
    }
  }

  BorderSide _side() {
    switch (color) {
      case EagleButtonColor.brand:
        switch (type) {
          case EagleButtonType.primary:
            return BorderSide.none;
          case EagleButtonType.secondary:
            return BorderSide(color: EagleColors.oustBlendBorder);
          case EagleButtonType.tertiary:
            return BorderSide.none;
        }
      case EagleButtonColor.red:
        switch (type) {
          case EagleButtonType.primary:
            return BorderSide.none;
          case EagleButtonType.secondary:
            return BorderSide(color: TWTwoColors.red.shade200);
          case EagleButtonType.tertiary:
            return BorderSide.none;
        }
      case EagleButtonColor.orange:
        switch (type) {
          case EagleButtonType.primary:
            return BorderSide.none;
          case EagleButtonType.secondary:
            return BorderSide(color: TWTwoColors.amber.shade200);
          case EagleButtonType.tertiary:
            return BorderSide.none;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    return EagleBaseButton(
        text: text,
        busy: busy,
        disabled: disabled,
        disableIfNoConnection: disableIfNoConnection,
        onPressed: onPressed,
        leading: leading,
        trailing: trailing,
        padding: padding,
        color: _color(),
        textColor: _textColor(),
        hoverColor: _hoverColor(),
        highlightColor: _highlightColor(),
        disabledColor: _disabledColor(),
        disabledTextColor: _disabledTextColor(),
        side: _side());
  }
}

class EagleBaseButton extends StatefulWidget {
  final String text;
  final bool busy;
  final bool disabled;
  final bool disableIfNoConnection;
  final void Function()? onPressed;
  final IconData? leading;
  final IconData? trailing;

  final Color color;
  final Color textColor;
  final Color hoverColor;
  final Color highlightColor;
  final Color disabledColor;
  final Color disabledTextColor;
  final BorderSide side;
  final EdgeInsetsGeometry padding;

  const EagleBaseButton(
      {required this.text,
      required this.color,
      required this.textColor,
      required this.hoverColor,
      required this.highlightColor,
      required this.disabledColor,
      required this.disabledTextColor,
      required this.side,
      this.busy = false,
      this.disabled = false,
      this.disableIfNoConnection = false,
      this.padding = const EdgeInsets.all(8.0),
      this.onPressed,
      this.leading,
      this.trailing});

  @override
  _EagleBaseButtonState createState() => _EagleBaseButtonState();
}

class _EagleBaseButtonState extends State<EagleBaseButton> {
  // TODO: Reset to true when reenabling connectivity
  bool hasNoInternet = false;
  var connectivitySubscription;

  bool get isDisabledBecauseNotConnected =>
      widget.disableIfNoConnection && hasNoInternet;

  bool get isDisabled =>
      isDisabledBecauseNotConnected ||
      widget.onPressed == null ||
      widget.disabled;

  Color get currentTextColor =>
      isDisabled ? widget.disabledTextColor : widget.textColor;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        elevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        onPressed: isDisabled ? null : widget.onPressed,
        color: widget.color,
        hoverColor: widget.hoverColor,
        highlightColor: widget.highlightColor,
        disabledColor: widget.disabledColor,
        splashColor: Colors.transparent,
        shape: RoundedRectangleBorder(
            side: widget.side,
            borderRadius: BorderRadius.circular(defaultRadius)),
        child: Padding(
          padding: widget.padding,
          child: widget.busy
              ? SizedBox(
                  height: 17,
                  width: 17,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation(currentTextColor),
                  ),
                )
              : Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.leading != null) ...[
                      Icon(widget.leading!, color: currentTextColor, size: 16),
                      SizedBox(width: 8)
                    ],
                    if (isDisabledBecauseNotConnected) ...[
                      Icon(Icons.cloud_off, color: currentTextColor, size: 16),
                      SizedBox(width: 8)
                    ],
                    Flexible(
                      child: EagleText.textM(
                          isDisabledBecauseNotConnected
                              ? 'Pas de connexion'
                              : widget.text,
                          bold: true,
                          selectable: false,
                          color: currentTextColor),
                    ),
                    if (widget.trailing != null) ...[
                      SizedBox(width: 8),
                      Icon(widget.trailing!, color: currentTextColor, size: 16)
                    ],
                  ],
                ),
        ));
  }

  // @override
  // void initState() {
  //   super.initState();

  //   Connectivity().checkConnectivity().then((ConnectivityResult result) {
  //     setConnectivity(result);
  //   });

  //   connectivitySubscription = Connectivity()
  //       .onConnectivityChanged
  //       .listen((ConnectivityResult result) {});
  // }

  // void setConnectivity(ConnectivityResult result) {
  //   setState(() {
  //     hasNoInternet = result == ConnectivityResult.none;
  //   });
  // }

  // // Be sure to cancel subscription after you are done
  // @override
  // void dispose() {
  //   super.dispose();
  //   connectivitySubscription.cancel();
  // }
}
