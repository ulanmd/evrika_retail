import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:flutter/material.dart';

class ItemTitleLabel extends StatelessWidget {
  const ItemTitleLabel({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: EvrikaTextStyles.darkS14W400
    );
  }
}
