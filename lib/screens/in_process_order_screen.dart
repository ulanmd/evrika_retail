import 'package:dotted_line/dotted_line.dart';
import 'package:evrika_retail/add_item_btn_group.dart';
import 'package:evrika_retail/extend_time_widget.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';

import '../about_order_row.dart';
import '../evrika_colors.dart';
import '../widgets/grey_label.dart';
import '../item_block_widget.dart';

class InProcessOrderScreen extends StatelessWidget {
  const InProcessOrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: true,
      appBar: appBarWithBackBtn(context, 'Заявка #123'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ExtendTimeWidget(),
              SizedBox(
                height: 35,
              ),
              AboutOrderRowWidget(
                title: 'Статус заявки:',
                widget: Container(
                  width: 100,
                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
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
              ItemBlockWidget(isOnProcess: true,),
              SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 15,
              ),
              AddItemBtnGroup(),
              SizedBox(height: 15,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      color: EvrikaColors.boxShadowColor, width: 2),
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
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GreyLabel(text: 'Cкидка:'),
                        Text('Отсутствует'),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GreyLabel(text: 'Бонусы:'),
                        Text('Отсутствует')
                      ],
                    ),
                    SizedBox(height: 16,),
                    DottedLine(
                      dashColor: EvrikaColors.borderGreyColor,
                      lineThickness: 2,
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Итоговая сумма:', style: TextStyle(fontSize: 13),),
                        PriceLabel(price: '100 000')
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
