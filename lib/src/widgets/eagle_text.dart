import 'package:eagle/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const blueGray900 = Color(0xff0f172a);

class EagleText extends StatelessWidget {
  final String text;
  final TextStyle style;
  bool gradient = false;
  bool selectable = true;
  TextAlign textAlign;

  EagleText.header1(this.text,
      {this.gradient = false,
      this.selectable = true,
      this.textAlign = TextAlign.start,
      Color color = blueGray900})
      : style = GoogleFonts.poppins(
            textStyle: EagleTypo.header1.copyWith(color: color));

  EagleText.header2(this.text,
      {this.gradient = false,
      this.selectable = true,
      this.textAlign = TextAlign.start,
      Color color = blueGray900})
      : style = GoogleFonts.poppins(
            textStyle: EagleTypo.header2.copyWith(color: color));

  EagleText.header3(this.text,
      {this.gradient = false,
      this.selectable = true,
      this.textAlign = TextAlign.start,
      Color color = blueGray900})
      : style = GoogleFonts.poppins(
            textStyle: EagleTypo.header3.copyWith(color: color));

  EagleText.header4(this.text,
      {this.gradient = false,
      this.selectable = true,
      this.textAlign = TextAlign.start,
      Color color = blueGray900})
      : style = GoogleFonts.poppins(textStyle: EagleTypo.header4)
            .copyWith(color: color);

  EagleText.subtitle1(this.text,
      {this.selectable = true,
      this.textAlign = TextAlign.start,
      Color color = blueGray900})
      : style = GoogleFonts.poppins(
            textStyle: EagleTypo.subtitle1.copyWith(color: color));

  EagleText.subtitle2(this.text,
      {this.selectable = true,
      this.textAlign = TextAlign.start,
      Color color = blueGray900})
      : style = GoogleFonts.poppins(
            textStyle: EagleTypo.subtitle2.copyWith(color: color));

  EagleText.textM(this.text,
      {bool bold = false,
      this.selectable = true,
      this.textAlign = TextAlign.start,
      Color color = blueGray900})
      : style = GoogleFonts.inter(
            textStyle: bold
                ? EagleTypo.textMBold.copyWith(color: color)
                : EagleTypo.textM.copyWith(color: color));

  EagleText.textS(this.text,
      {bool bold = false,
      this.selectable = true,
      this.textAlign = TextAlign.start,
      Color color = blueGray900})
      : style = GoogleFonts.inter(
            textStyle: bold
                ? EagleTypo.textSBold.copyWith(color: color)
                : EagleTypo.textS.copyWith(color: color));
  @override
  Widget build(BuildContext context) {
    Widget textWidget;
    // Gradient text has to be white
    final textStyle = !gradient ? style : style.copyWith(color: Colors.white);

    if (selectable) {
      textWidget = SelectableText(text, style: textStyle, textAlign: textAlign);
    } else {
      textWidget = Text(text, style: textStyle, textAlign: textAlign);
    }

    if (!gradient) {
      return textWidget;
    } else {
      return ShaderMask(
        shaderCallback: (bounds) => EagleColors.oustGradient.createShader(
          // For some reason bounds is received too large ... Dividing by 4 as a hack
          Rect.fromLTRB(0, 0, bounds.width / 4, bounds.height),
        ),
        child: textWidget,
      );
    }
  }
}
