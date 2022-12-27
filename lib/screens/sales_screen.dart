import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
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
           Text(
            'Ваши наработки',
            style: EvrikaTextStyles.darkS20W500,
          ),
          const SizedBox(
            height: 20,
          ),
          BottomDatePickerWidget(isRange: true, text: 'Дата',),
          const SizedBox(
            height: 30,
          ),
          Container(
            decoration: const BoxDecoration(
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
                 Text(
                  'За сегодня:',
                  style: EvrikaTextStyles.darkS13W400,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  '600 ₸',
                  style: EvrikaTextStyles.primaryS13W500,
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

