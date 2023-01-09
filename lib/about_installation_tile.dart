import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/grey_label.dart';
import 'package:evrika_retail/widgets/required_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_date_picker.dart';
import 'config/evrika_text_styles.dart';
import 'utils/consts.dart';
import 'config/evrika_colors.dart';

class AboutInstallationTile extends StatefulWidget {
  const AboutInstallationTile({Key? key}) : super(key: key);

  @override
  State<AboutInstallationTile> createState() => _AboutInstallationTileState();
}

class _AboutInstallationTileState extends State<AboutInstallationTile> {
  bool _customTileExpanded = false;
  String _showHideText = 'Показать';
  @override
  Widget build(BuildContext context) {
    bool toDelivery = true;
    String gender = "male";
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: EvrikaColors.kLightColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            'Информация об установке',
            style: TextStyle(fontSize: 17),
          ),
          trailing: InkWell(
            child: Text(
              _showHideText,
              style: TextStyle(color: EvrikaColors.kPrimaryColor),
            ),
          ),
          onExpansionChanged: (bool expanded) {
            setState(() {
              _customTileExpanded = expanded;
              _showHideText = _customTileExpanded ? 'Скрыть' : 'Показать';
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Установка',
                        style: EvrikaTextStyles.darkS15W400,
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
                            RequiredLabel(text: 'Выберите адрес доставки'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              child: RadioListTile(
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 0.0),
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
                            RequiredLabel(text: 'Дата установки'),
                            SizedBox(
                              height: 5,
                            ),
                            BottomDatePickerWidget(
                              isRange: false,
                              text: 'Выберите дату доставки',
                            ),
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
                            GreyLabel(
                              text: 'Дополнительно',
                              fontSize: 12,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextField(
                              // autofocus: true,
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
      ),
    );
  }
}
