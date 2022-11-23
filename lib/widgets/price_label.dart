import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:flutter/material.dart';

class PriceLabel extends StatelessWidget {
  const PriceLabel({Key? key,required this.price}) : super(key: key);

  final String price;

  @override
  Widget build(BuildContext context) {
    return Text('$price ₸', style: const TextStyle(
        fontSize: 15,
       // fontWeight: FontWeight.bold,
        color: EvrikaColors.mainOrange
    ),);
  }
}
