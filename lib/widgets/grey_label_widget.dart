import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:flutter/material.dart';


class GreyLabel extends StatelessWidget {
  const GreyLabel({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: EvrikaTextStyles.labelGrayS12W400,
      ),
    );
  }
}
