import 'package:flutter/material.dart';

import 'config/evrika_colors.dart';

class ModalControlLine extends StatelessWidget {
  const ModalControlLine({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
      width: 40,
      height: 4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: EvrikaColors.modalControlLineColor,
      ),
    ));
  }
}
