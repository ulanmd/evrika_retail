import 'package:evrika_retail/screens/ymap_screen.dart';
import 'package:evrika_retail/widgets/grey_label.dart';
import 'package:evrika_retail/widgets/required_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'bottom_date_picker.dart';
import 'consts.dart';
import 'config/evrika_colors.dart';

class AboutInstallationTile extends StatelessWidget {
  const AboutInstallationTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool toDelivery = true;
    String gender = "male";
    return   Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: EvrikaColors.kLightColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ExpansionTile(
        title: Text(
          'Информация о доставке',
          style: TextStyle(fontSize: 17),
        ),
        trailing: InkWell(
          child: Text(
            'Показать',
            style: TextStyle(color: EvrikaColors.kPrimaryColor),
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Установка',
                      style: TextStyle(
                          fontSize: 15, color: EvrikaColors.darkColor),
                    ),
                    Spacer(),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        activeColor: EvrikaColors.kPrimaryColor,
                        value: toDelivery,
                        onChanged: (bool value) {},
                      ),
                    )
                  ],
                ),
                toDelivery
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    RequiredLabel(text: 'Адрес установки'),
                    SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: YMapScreen()));
                      },
                      child: Container(
                        height: 47,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: EvrikaColors.boxShadowColor,
                            borderRadius:
                            BorderRadius.all(Radius.circular(5))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: GreyLabel(
                                    text: 'Выберите адрес на карте'),
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
                    RequiredLabel(text: 'Дата установки'),
                    SizedBox(
                      height: 5,
                    ),
                    BottomDatePickerWidget(isRange: false, text: 'Выберите дату доставки',),
                    SizedBox(
                      height: 20,
                    ),
                    RequiredLabel(text: 'Время установки'),
                    SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: EvrikaColors.kPrimaryColor,
                                  width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
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
                                  color: EvrikaColors.kLightGray,
                                  width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
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
                                  color: EvrikaColors.kLightGray,
                                  width: 1),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
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
                      autofocus: true,
                      decoration: InputDecoration(),
                      keyboardType: TextInputType.multiline,
                      minLines: 2,
                      maxLines: 2,
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                )
                    : Container()
              ],
            ),
          )
        ],
      ),
    );
  }
}
