import 'package:evrika_retail/add_item_btn_group.dart';
import 'package:flutter/material.dart';

import '../evrika_colors.dart';
import '../utils.dart';

class AddItemsScreen extends StatelessWidget {
  const AddItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Выбор товаров'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
        AddItemBtnGroup()
          ],
        ),
      ),
    );
  }
}
