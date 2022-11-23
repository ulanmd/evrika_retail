import 'package:evrika_retail/screens/ymap_screen.dart';
import 'package:evrika_retail/widgets/grey_label.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:evrika_retail/widgets/required_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'bottom_date_picker.dart';
import 'consts.dart';
import 'config/evrika_colors.dart';

class DeliveryOptionsBottomModal extends StatelessWidget {
  const DeliveryOptionsBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool toDelivery = true;
    String gender = "male";
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      //height: MediaQuery.of(context).size.height * 0.85,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    'Заполнение данных о доставке',
                    style:
                        TextStyle(color: EvrikaColors.darkColor, fontSize: 17),
                  ),
                  Spacer(),
                  InkWell(
                     onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(
                      '$kAssetIcons/close.svg',
                      color: EvrikaColors.kLabelGrey,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Placeholder(
                    fallbackWidth: 50,
                    fallbackHeight: 50,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  SizedBox(
                    height: 50,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'iPhone 13 Pro Max',
                          style: TextStyle(
                              color: EvrikaColors.darkColor, fontSize: 15),
                        ),
                        Spacer(),
                        PriceLabel(price: '300')
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Spacer(),
                  InkWell(
                    child: Row(
                      children: [
                        Text('Продублировать данные'),
                        SizedBox(
                          width: 5,
                        ),
                        SvgPicture.asset(
                          '$kAssetIcons/copy.svg',
                          width: 12,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RequiredLabel(text: 'Контакт №1'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 47,
                        child: TextField(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GreyLabel(text: 'Контакт №2:'),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 47,
                        child: TextField(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RequiredLabel(text: 'Адрес доставки'),
                  SizedBox(
                    height: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          PageTransition(
                              type: PageTransitionType.bottomToTop,
                              child: YMapScreen()));
                    },
                    child: Container(
                      height: 47,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: EvrikaColors.boxShadowColor,
                          borderRadius: BorderRadius.all(Radius.circular(5))),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(15),
                              child: GreyLabel(text: 'Выберите адрес на карте'),
                            ),
                          ),
                          Container(
                            width: 47,
                            padding: EdgeInsets.all(12),
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: EvrikaColors.lightBlueColor,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                )),
                            child: SvgPicture.asset(
                              '$kAssetIcons/location.svg',
                              width: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Дом:'),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 47,
                              child: TextField(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Квартира:'),
                            SizedBox(
                              height: 5,
                            ),
                            Container(height: 47, child: TextField()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Подъезд:'),
                            SizedBox(
                              height: 5,
                            ),
                            Container(height: 47, child: TextField()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Этаж:'),
                            SizedBox(
                              height: 5,
                            ),
                            Container(height: 47, child: TextField()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RequiredLabel(text: 'Дата доставки'),
                  SizedBox(
                    height: 5,
                  ),
                  BottomDatePickerWidget(isRange: false, text: 'Дата',),
                  SizedBox(
                    height: 20,
                  ),
                  RequiredLabel(text: 'Время доставки'),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: EvrikaColors.kPrimaryColor, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: RadioListTile(
                          title: Text("11:00-17:00"),
                          value: "male",
                          groupValue: gender,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: EvrikaColors.kLightGray, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: RadioListTile(
                          title: Text("17:00-21:00"),
                          value: "female",
                          groupValue: gender,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: EvrikaColors.kLightGray, width: 1),
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        child: RadioListTile(
                          title: Text("21:00-23:00"),
                          value: "other",
                          groupValue: gender,
                          onChanged: (value) {},
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GreyLabel(text: 'Дополнительно'),
                  SizedBox(
                    height: 5,
                  ),
                  TextField(
                    decoration: InputDecoration(),
                    keyboardType: TextInputType.multiline,
                    minLines: 2,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 15,
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Сохранить',
                  style: TextStyle(fontSize: 17),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showDeliveryOptions(context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
    builder: (context) => Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: const DeliveryOptionsBottomModal(),
    ),
  );
}
