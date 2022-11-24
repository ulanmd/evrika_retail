import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GreyLabel extends StatelessWidget {
  const GreyLabel({Key? key, required this.text, required this.fontSize}) : super(key: key);

  final String text;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
            color: EvrikaColors.kLabelGrey,
            fontSize: fontSize,
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
