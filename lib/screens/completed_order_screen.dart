import 'package:dotted_border/dotted_border.dart';
import 'package:evrika_retail/about_order_row.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../config/evrika_text_styles.dart';
import '../item_block_widget.dart';

class CompletedOrderScreen extends StatelessWidget {
  const CompletedOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('$kAssetIcons/back.svg'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Заявка #123',
          style: TextStyle(color: EvrikaColors.darkColor),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            AboutOrderRowWidget(
              title: 'Статус заявки:',
              widget: Container(
                width: 100,
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                decoration: BoxDecoration(
                    color: EvrikaColors.kLightGreenLabel,
                    borderRadius: BorderRadius.circular(5)),
                child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Закрыта',
                      style: EvrikaTextStyles.completedS10W500,
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AboutOrderRowWidget(
              title: 'ФИО клиента:',
              widget: Text('Erjigit Mysalov', style: EvrikaTextStyles.darkS14W500),
            ),
            SizedBox(
              height: 15,
            ),
            AboutOrderRowWidget(
              title: 'Номер телефона:',
              widget: Text(
                '+7 7779098756',
                style: EvrikaTextStyles.darkS14W500,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AboutOrderRowWidget(
              title: 'Количество товаров:',
              widget: Text(
                '2',
                style: EvrikaTextStyles.darkS14W500,
              ),
            ),
            /// NOTE: Broker Status
            const SizedBox(
              height: 15,
            ),
            AboutOrderRowWidget(
              title: 'Статус брокера:',
              widget: Text(
                'Одобрено',
                style: EvrikaTextStyles.completedS14W500,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            DottedBorder(
              dashPattern: [4,],
              color: EvrikaColors.kLightGray,
              borderType: BorderType.RRect,
              radius: Radius.circular(10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Итоговая сумма:',
                      style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    PriceLabel(price: '100 000', fontSize: 15,)
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Проданные товары:',
                style: TextStyle(fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    ItemBlockWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    ItemBlockWidget(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
