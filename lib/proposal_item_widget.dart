import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/screens/in_process_order_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'config/evrika_colors.dart';
import 'widgets/grey_label_widget.dart';
import 'widgets/label_stack_widget.dart';

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
          Navigator.push(
              context,
              PageTransition(
                  type: PageTransitionType.bottomToTop, child: InProcessOrderScreen()));
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
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          'Заявка №123',
                          style: EvrikaTextStyles.darkS15W500,
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
                        SvgPicture.asset('$kAssetIcons/sw.svg'),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
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
