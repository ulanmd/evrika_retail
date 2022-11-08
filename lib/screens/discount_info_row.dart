import 'package:evrika_retail/evrika_colors.dart';
import 'package:flutter/material.dart';

class DiscountInfoRow extends StatelessWidget {
  const DiscountInfoRow({Key? key, required this.name, required this.price})
      : super(key: key);

  final String name;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyle(color: EvrikaColors.darkColor, fontSize: 16),
        ),
        Spacer(),
        Text(
          price,
          style: TextStyle(color: EvrikaColors.mainOrange),
        ),
      ],
    );
  }
}
