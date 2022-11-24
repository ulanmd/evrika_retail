import 'package:evrika_retail/add_item_btn_group.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../added_item_widget.dart';
import '../utils.dart';
import 'creating_order_screen.dart';

class AddItemsScreen extends StatelessWidget {
  const AddItemsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Выбор товаров'),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child:
            // Column(
            //   children: [
            //     AddItemBtnGroup(),
            //     SizedBox(
            //       height: 80,
            //     ),
            //     SvgPicture.asset('$kAssetIcons/nothing_was_added.svg'),
            //     SizedBox(
            //       height: 30,
            //     ),
            //     const Text(
            //       'Нет добавленных товаров',
            //       style: TextStyle(color: EvrikaColors.kPrimaryColor, fontSize: 20),
            //     ),
            //   ],
            // ),
            Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AddItemBtnGroup(),
            SizedBox(
              height: 30,
            ),
            Text(
              'Добавленные товары',
              style: EvrikaTextStyles.darkS20W500,
            ),
            SizedBox(
              height: 30,
            ),
            AddedItemWidget(),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: CreatingOrderScreen(),
                    ),
                  );
                },
                child: Text(
                  'Создать заявку',
                  style: TextStyle(fontSize: 17),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
