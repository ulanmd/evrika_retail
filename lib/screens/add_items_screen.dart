import 'package:evrika_retail/add_item_btn_group.dart';
import 'package:evrika_retail/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
        AddItemBtnGroup(),
            SizedBox(height: 80,),
            SvgPicture.asset('$kAssetIcons/nothing_was_added.svg'),
            SizedBox(height: 30,),
            const Text('Нет добавленных товаров', style: TextStyle(
              color: EvrikaColors.kPrimaryColor,
              fontSize: 20
            ),)
          ],
        ),
      ),
    );
  }
}
