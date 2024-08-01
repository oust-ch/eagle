import 'package:flutter/material.dart';

abstract class EagleTypo {
  static const TextStyle header1 = TextStyle(
      fontSize: EagleFontSize.xl4,
      fontWeight: FontWeight.bold,
      height: EagleLineHeight.loose);
  static const TextStyle header2 = TextStyle(
      fontSize: EagleFontSize.xl3,
      fontWeight: FontWeight.bold,
      height: EagleLineHeight.loose);
  static const TextStyle header3 = TextStyle(
      fontSize: EagleFontSize.xl2,
      fontWeight: FontWeight.bold,
      height: EagleLineHeight.relaxed);
  static const TextStyle header4 = TextStyle(
      fontSize: EagleFontSize.xl,
      fontWeight: FontWeight.bold,
      height: EagleLineHeight.relaxed);
  static const TextStyle subtitle2 = TextStyle(fontSize: EagleFontSize.lg);
  static const TextStyle subtitle2Bold =
      TextStyle(fontSize: EagleFontSize.lg, fontWeight: FontWeight.bold);
  static const TextStyle subtitle1 = TextStyle(fontSize: EagleFontSize.xl);
  static const TextStyle subtitle1Bold =
      TextStyle(fontSize: EagleFontSize.xl, fontWeight: FontWeight.bold);

  static const TextStyle textM = TextStyle(fontSize: EagleFontSize.md);
  static const TextStyle textMBold =
      TextStyle(fontSize: EagleFontSize.md, fontWeight: FontWeight.bold);

  static const TextStyle textS = TextStyle(fontSize: EagleFontSize.sm);
  static const TextStyle textSBold =
      TextStyle(fontSize: EagleFontSize.sm, fontWeight: FontWeight.bold);
}

abstract class EagleFontSize {
  static const xs = 10.0;
  static const sm = 12.0;
  static const md = 14.0;
  static const lg = 16.0;
  static const xl = 18.0;
  static const xl2 = 22.0;
  static const xl3 = 28.0;
  static const xl4 = 36.0;
}

// TODO: Check and adjust line heights
abstract class EagleLineHeight {
  static const none = 1.0;
  static const tight = 1.25;
  static const snug = 1.375;
  static const normal = 1.5;
  static const relaxed = 1.625;
  static const loose = 2.0;
}

abstract class EagleColors {
  // Primary Color
  static const oustBlendMain = Color(0xFF15C16D);
  static const oustBlendSurface = Color(0xFFE3FCF1);
  static const oustBlendBorder = Color(0xFFC8F9E4);
  static const oustBlendHover = Color(0xFF006F59);
  static const oustBlendPressed = Color(0xFF00574B);

  static const oustGreen = Color(0xFF21C052);
  static const oustTeal = Color(0xFFE0E9C74);

  static const oustGradient = LinearGradient(
    colors: [EagleColors.oustTeal, EagleColors.oustGreen],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

const double defaultRadius = 8.0;
