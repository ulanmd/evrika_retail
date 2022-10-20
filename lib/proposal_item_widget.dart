import 'package:evrika_retail/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../evrika_colors.dart';
import 'grey_label_widget.dart';
import 'label_stack_widget.dart';

class ProposalItemWidget extends StatelessWidget {
  const ProposalItemWidget(
      {Key? key, required this.type, required this.color, required this.text})
      : super(key: key);

  final String? type;
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        onTap: () {
          print('cliked');
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
         //     margin: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        '$kAssetIcons/order_icon.svg',
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Заявка №123',
                          style: TextStyle(
                              fontSize: 15, color: EvrikaColors.darkColor),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'ФИО клиента'),
                            Text(
                              'Ержігіт Я.Ю',
                              style: TextStyle(
                                  fontSize: 12, color: EvrikaColors.darkColor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Номер клиента'),
                            Text(
                              '87718902343',
                              style: TextStyle(
                                  fontSize: 12, color: EvrikaColors.darkColor),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Количество товаров',
                              style: TextStyle(
                                  fontSize: 10, color: EvrikaColors.kLightGray),
                            ),
                            Text(
                              '10',
                              style: TextStyle(
                                  fontSize: 12, color: EvrikaColors.darkColor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Итоговая сумма:',
                              style: TextStyle(
                                  fontSize: 10, color: EvrikaColors.kLightGray),
                            ),
                            Text(
                              '5 000 000 ₸',
                              style: TextStyle(
                                  fontSize: 12, color: EvrikaColors.mainOrange),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: EvrikaColors.boxShadowColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    width: double.infinity,
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('$kAssetIcons/sw.png'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '2дня : 13час : 51мин : 32сек',
                          style: TextStyle(
                            fontSize: 13,
                            color: EvrikaColors.darkColor,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                top: 8,
                right: -5,
                child: LabelStackWidget(
                  type: type,
                  color: color,
                  text: text,
                )),
          ],
        ),
      ),
    );
  }
}
