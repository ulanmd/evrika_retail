import 'package:flutter/material.dart';

import 'config/evrika_colors.dart';

class QrLoading extends StatelessWidget {
  const QrLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.all(10),
      child: CircularProgressIndicator(
        color: EvrikaColors.kPrimaryColor,
      ),
    );
  }
}