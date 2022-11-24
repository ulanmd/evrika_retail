import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel(
      {Key? key,
      required this.price,
      required this.fontSize,
      this.is500 = false})
      : super(key: key);

  final String price;
  final double fontSize;
  final bool is500;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$price ₸',
      style: GoogleFonts.nunito(
        textStyle: TextStyle(
            color: EvrikaColors.mainOrange,
            fontSize: fontSize,
            fontWeight: is500 ? FontWeight.w500 : FontWeight.w600),
      ),
    );
  }
}
