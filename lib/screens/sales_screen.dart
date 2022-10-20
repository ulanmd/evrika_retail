import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/evrika_colors.dart';
import 'package:evrika_retail/sale_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../bottom_date_picker.dart';
class SalesScreen extends StatelessWidget {
  const SalesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Ваши наработки',
            style: TextStyle(
                color: EvrikaColors.darkColor,
                fontWeight: FontWeight.w500,
                fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          BottomDatePickerWidget(),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(
                color: EvrikaColors.kInfoBlue,
                borderRadius: BorderRadius.all(Radius.circular(5))),
            padding: EdgeInsets.all(15),
            child: Row(
              children: [
                SvgPicture.asset(
                  '$kAssetIcons/info.svg',
                  width: 22,
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'За сегодня:',
                  style: TextStyle(fontSize: 15, color: EvrikaColors.darkColor),
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '600 ₸',
                  style: TextStyle(
                      fontSize: 15, color: EvrikaColors.kPrimaryColor),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          SaleItemWidget(),
          SizedBox(height: 10,),
          SaleItemWidget(),
          SizedBox(height: 10,),
          SaleItemWidget(),
        ],
      ),
    );
  }
}

