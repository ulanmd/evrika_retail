import 'package:dotted_line/dotted_line.dart';
import 'package:evrika_retail/add_item_btn_group.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/extend_time_widget.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';

import '../about_order_row.dart';
import '../config/evrika_colors.dart';
import '../show_broker_info.dart';
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
                widget: Text(
                  'Erjigit Mysalov',
                  style: EvrikaTextStyles.darkS14W500,
                ),
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
                widget: Text('2', style: EvrikaTextStyles.darkS14W500),
              ),
              const SizedBox(
                height: 15,
              ),
              AboutOrderRowWidget(
                title: 'Статус брокера:',
                widget: InkWell(
                  onTap: () {
                    showBrokerInfoModal(context);
                  },
                  child: Text(
                    'Одобрено ⓘ',
                    style: EvrikaTextStyles.completedS14W500,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ItemBlockWidget(
                isOnProcess: true,
              ),
              const SizedBox(
                height: 15,
              ),
              AddItemBtnGroup(),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
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
                        GreyLabel(
                          text: 'Бонусы:',
                          fontSize: 12,
                        ),
                        Text('Отсутствует')
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    DottedLine(
                      dashColor: EvrikaColors.kLightGray,
                      lineThickness: 2,
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Итого без скидок:', style: EvrikaTextStyles.darkS13W400,),
                        PriceLabel(price: '1 000 000', fontSize: 13, is500: true,)
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Cкидки:', style: EvrikaTextStyles.darkS13W400,),
                        PriceLabel(price: '21300', fontSize: 13, is500: true,)
                       // Text('Отсутствует'),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Итоговая с учетом скидок:',
                          style: EvrikaTextStyles.darkS15W600,
                        ),
                        PriceLabel(
                          price: '100 000',
                          fontSize: 15,
                        )
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
