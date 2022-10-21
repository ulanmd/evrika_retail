import 'package:dotted_line/dotted_line.dart';
import 'package:evrika_retail/about_order_row.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/evrika_colors.dart';
import 'package:evrika_retail/grey_label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

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
                      style: TextStyle(color: EvrikaColors.kSuccessColor, fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AboutOrderRowWidget(
              title: 'ФИО клиента:',
              widget: Text('Erjigit Mysalov', style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            SizedBox(
              height: 15,
            ),
            AboutOrderRowWidget(
              title: 'Номер телефона:',
              widget: Text(
                '+7 7779098756',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            AboutOrderRowWidget(
              title: 'Количество товаров:',
              widget: Text(
                '2',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            AboutOrderRowWidget(
              title: 'Статус брокера:',
              widget: Text(
                'Одобрено',
                style: TextStyle(
                    color: EvrikaColors.kSuccessColor,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 10),
              decoration: BoxDecoration(
                border:
                    Border.all(color: EvrikaColors.boxShadowColor, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GreyLabel(text: 'ФИО клиента:'),
                      Text('Ержігіт Мысалов')
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      GreyLabel(text: 'Cкидка:'),
                      Text('Отсутствует'),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [GreyLabel(text: 'Бонусы:'), Text('Отсутствует')],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const DottedLine(
                    dashColor: EvrikaColors.borderGreyColor,
                    lineThickness: 2,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Итоговая сумма:',
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '100 000₸',
                        style: TextStyle(
                            fontSize: 14, color: EvrikaColors.mainOrange, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
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
