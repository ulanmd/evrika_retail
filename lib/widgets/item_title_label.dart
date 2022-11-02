import 'package:flutter/material.dart';

class ItemTitleLabel extends StatelessWidget {
  const ItemTitleLabel({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
    );
  }
}
