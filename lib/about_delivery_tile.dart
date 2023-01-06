import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/modal_divider_widget.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/grey_label.dart';
import 'package:evrika_retail/widgets/required_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'bottom_date_picker.dart';
import 'config/evrika_colors.dart';

class AboutDeliveryTile extends StatefulWidget {
  const AboutDeliveryTile({Key? key}) : super(key: key);

  @override
  State<AboutDeliveryTile> createState() => _AboutDeliveryTileState();
}

class _AboutDeliveryTileState extends State<AboutDeliveryTile> {
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
      child: ExpansionTile(
        title:
            Text('Информация о доставке', style: EvrikaTextStyles.darkS17W400),
        trailing: InkWell(
          child: Text(
            _showHideText,
            style: EvrikaTextStyles.primaryS15W400,
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
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Доставка',
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
                              dense: true,
                              contentPadding: EdgeInsets.zero,
                              title: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      "улица Орынбаева, 21а",
                                      style: EvrikaTextStyles.darkS15W400,
                                    ),
                                  ),
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
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(context, PageTransition(type: PageTransitionType.bottomToTop, child: YMapScreen()));
                          //   },
                          //   child: Container(
                          //     height: 47,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //         color: EvrikaColors.boxShadowColor,
                          //         borderRadius:
                          //             BorderRadius.all(Radius.circular(5))),
                          //     child: Row(
                          //       children: [
                          //         Expanded(
                          //           child: Container(
                          //             padding: EdgeInsets.all(15),
                          //             child: GreyLabel(
                          //                 text: 'Выберите адрес на карте'),
                          //           ),
                          //         ),
                          //         Container(
                          //           width: 47,
                          //           padding: EdgeInsets.all(12),
                          //           height: double.infinity,
                          //           decoration: BoxDecoration(
                          //               color: EvrikaColors.lightBlueColor,
                          //               borderRadius: BorderRadius.only(
                          //                 topRight: Radius.circular(5),
                          //                 bottomRight: Radius.circular(5),
                          //               )),
                          //           child: SvgPicture.asset(
                          //             '$kAssetIcons/location.svg',
                          //             width: 14,
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // )
                          SizedBox(
                            height: 20,
                          ),
                          RequiredLabel(text: 'Дата доставки'),
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
                          RequiredLabel(text: 'Время доставки'),
                          SizedBox(
                            height: 5,
                          ),
                          Column(
                            children: [
                              Container(
                                padding: EdgeInsets.zero,
                                //  color: Colors.amber,
                                child: RadioListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    "11:00-17:00",
                                    style: EvrikaTextStyles.darkS15W400,
                                  ),
                                  value: "male",
                                  groupValue: gender,
                                  onChanged: (value) {},
                                ),
                              ),
                              ModalDivider(),
                              Container(
                                padding: EdgeInsets.zero,
                                //   color: Colors.amber,
                                child: RadioListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    "11:00-17:00",
                                    style: EvrikaTextStyles.darkS15W400,
                                  ),
                                  value: "other",
                                  groupValue: gender,
                                  onChanged: (value) {},
                                ),
                              ),
                              ModalDivider(),
                              Container(
                                padding: EdgeInsets.zero,
                                //   color: Colors.amber,
                                child: RadioListTile(
                                  dense: true,
                                  contentPadding: EdgeInsets.zero,
                                  title: Text(
                                    "17:00 - 21:00",
                                    style: EvrikaTextStyles.darkS15W400,
                                  ),
                                  value: "other",
                                  groupValue: gender,
                                  onChanged: (value) {},
                                ),
                              ),
                            ],
                          ),
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
