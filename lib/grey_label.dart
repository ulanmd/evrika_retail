import 'package:evrika_retail/evrika_colors.dart';
import 'package:flutter/material.dart';

class GreyLabel extends StatelessWidget {
  const GreyLabel({Key? key,required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(
      fontSize: 13,
      color: EvrikaColors.kLabelGrey
    ),);
  }
}
