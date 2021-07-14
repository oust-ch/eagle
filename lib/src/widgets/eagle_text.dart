import 'package:eagle/src/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EagleText extends StatelessWidget {
  final String text;
  final TextStyle style;
  bool gradient = false;

  EagleText.header1(this.text, {this.gradient = false})
      : style = GoogleFonts.poppins(textStyle: EagleTypo.header1);
  EagleText.header2(this.text, {this.gradient = false})
      : style = GoogleFonts.poppins(textStyle: EagleTypo.header2);
  EagleText.header3(this.text, {this.gradient = false})
      : style = GoogleFonts.poppins(textStyle: EagleTypo.header3);
  EagleText.header4(this.text, {this.gradient = false})
      : style = GoogleFonts.poppins(textStyle: EagleTypo.header4);
  EagleText.subtitle(this.text)
      : style = GoogleFonts.poppins(textStyle: EagleTypo.subheader);

  EagleText.textM(this.text, {bool bold = false})
      : style = GoogleFonts.inter(
            textStyle: bold ? EagleTypo.textMBold : EagleTypo.textM);

  EagleText.textS(this.text, {bool bold = false})
      : style = GoogleFonts.inter(
            textStyle: bold ? EagleTypo.textSBold : EagleTypo.textS);
  @override
  Widget build(BuildContext context) {
    if (!gradient) {
      return SelectableText(text, style: style);
    } else {
      return ShaderMask(
        shaderCallback: (bounds) => EagleColors.oustGradient.createShader(
          // For some reason bounds is received too large ... Dividing by 4 as a hack
          Rect.fromLTRB(0, 0, bounds.width / 4, bounds.height),
        ),
        child: Text(text, style: style.copyWith(color: Colors.white)),
      );
    }
  }
}
