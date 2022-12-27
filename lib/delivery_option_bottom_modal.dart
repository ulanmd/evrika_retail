import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/grey_label.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:evrika_retail/widgets/required_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_date_picker.dart';
import 'utils/consts.dart';
import 'config/evrika_colors.dart';

class DeliveryOptionsBottomModal extends StatelessWidget {
  const DeliveryOptionsBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool toDelivery = true;
    String gender = "male";
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
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
                    style: EvrikaTextStyles.darkS20W500,
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
                          style: EvrikaTextStyles.darkS15W500,
                        ),
                        Spacer(),
                        PriceLabel(
                          price: '300',
                          fontSize: 15,
                        )
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
                        Text(
                          'Продублировать данные',
                          style: EvrikaTextStyles.labelGrayS15W400,
                        ),
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
                      GreyLabel(
                        text: 'Контакт №2:',
                        fontSize: 12,
                      ),
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
                  RequiredLabel(text: 'Выберите адрес доставки'),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: RadioListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
                      title: Row(
                        children: [
                          Expanded(
                              child: Text(
                            "ЖК «Шахристан», 55, подъезд 1, этаж 1",
                            style: EvrikaTextStyles.darkS15W400,
                          )),
                          SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                      '$kAssetIcons/delete.svg')),
                              SizedBox(
                                width: 20,
                              ),
                              InkWell(
                                  onTap: () {
                                    showEditAddress(context);
                                  },
                                  child: SvgPicture.asset(
                                      '$kAssetIcons/edit.svg')),
                            ],
                          )
                        ],
                      ),
                      value: "male",
                      groupValue: gender,
                      onChanged: (value) {},
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: EvrikaColors.kPrimaryColor,
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('$kAssetIcons/plus.svg'),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          'Добавить новый адрес',
                          style: EvrikaTextStyles.primaryS15W400,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RequiredLabel(text: 'Дата доставки'),
                  SizedBox(
                    height: 5,
                  ),
                  BottomDatePickerWidget(
                    isRange: false,
                    text: 'Дата',
                  ),
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
                  GreyLabel(
                    text: 'Коментарий',
                    fontSize: 12,
                  ),
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
