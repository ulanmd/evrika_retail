import 'package:flutter/material.dart';

import '../evrika_colors.dart';

class GreyLabel extends StatelessWidget {
  const GreyLabel({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: const TextStyle(fontSize: 12, color: EvrikaColors.kLabelGrey),
      ),
    );
  }
}
