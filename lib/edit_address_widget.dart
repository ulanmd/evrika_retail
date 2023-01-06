import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/modal_control_line_widget.dart';
import 'package:evrika_retail/modal_divider_widget.dart';
import 'package:evrika_retail/screens/ymap_screen.dart';
import 'package:evrika_retail/widgets/grey_label.dart';
import 'package:evrika_retail/widgets/required_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'utils/consts.dart';
import 'config/evrika_colors.dart';

class EditAddressWidget extends StatelessWidget {
  const EditAddressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 20),
      constraints: BoxConstraints(maxHeight: 420),
      child: Column(
        children: [
          ModalControlLine(),
          SizedBox(
            height: 15,
          ),
          Text(
            'Добавление нового адреса',
            style: TextStyle(color: EvrikaColors.darkColor, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          ModalDivider(),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                //   mainAxisSize: MainAxisSize.min,
                children: [
                  RequiredLabel(text: 'Адрес доставки'),
                  SizedBox(
                    height: 10,
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
                              child: GreyLabel(
                                text: 'Выберите адрес на карте',
                                fontSize: 12,
                              ),
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
                            GreyLabel(
                              text: 'Улица:',
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
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(
                              text: 'Дом:',
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
                            GreyLabel(
                              text: 'Квартира:',
                              fontSize: 12,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(height: 47, child: TextField()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(
                              text: 'Подъезд:',
                              fontSize: 12,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(height: 47, child: TextField()),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(
                              text: 'Этаж:',
                              fontSize: 12,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(height: 47, child: TextField()),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Добавить',
                        style: EvrikaTextStyles.whiteS15W500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
