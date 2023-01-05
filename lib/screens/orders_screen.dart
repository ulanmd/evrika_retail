import 'package:evrika_retail/bottom_date_picker.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/screens/find_customer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../utils/consts.dart';
import '../config/evrika_colors.dart';
import '../proposal_item_widget.dart';
import '../state/loading.dart';
import '../utils.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loading = context.watch<Loading>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Stack(clipBehavior: Clip.none, children: [
        Observer(builder: (_) {
          return Container(
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  !loading.isSearchOpened
                      ? Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: BottomDatePickerWidget(
                                    isRange: true,
                                    text: '31.01.2022 — 28.02.2022',
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    showBottomStatusFilter(context);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: EvrikaColors.kLightGray,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    padding: EdgeInsets.all(18),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('$kAssetIcons/filter.svg'),
                                        // SizedBox(width: 5,),
                                        // Text('Статус', style: EvrikaTextStyles.lightGrayS15W400,)
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Column(
                              children: [
                                ProposalItemWidget(
                                    type: 'inProcess',
                                    color: EvrikaColors.inProcessColor,
                                    text: 'В процессе'),
                                SizedBox(
                                  height: 10,
                                ),
                                ProposalItemWidget(
                                    type: 'inProcess',
                                    color: EvrikaColors.inProcessColor,
                                    text: 'В процессе'),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  'Результаты поиска по запросу "123"',
                                  style: EvrikaTextStyles.darkS15W400,
                                ),
                                Spacer(),
                                InkWell(
                                  onTap: () {
                                    loading.setIsSearchOpened(false);
                                  },
                                  child: SvgPicture.asset('$kAssetIcons/close.svg'),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Divider(
                              height: 15,
                              color: EvrikaColors.kPrimaryColor,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            ProposalItemWidget(
                                type: 'inProcess',
                                color: EvrikaColors.inProcessColor,
                                text: 'В процессе'),
                            // SizedBox(
                            //   height: 80,
                            // ),
                            // SvgPicture.asset('$kAssetIcons/nothing_was_added.svg'),
                            // SizedBox(
                            //   height: 30,
                            // ),
                            // const Text(
                            //   'Ничего не найдено',
                            //   style: TextStyle(
                            //       color: EvrikaColors.kPrimaryColor, fontSize: 20),
                            // ),
                          ],
                        ),
                ],
              ),
            ),
          );
        }),
        Positioned(
          bottom: -10,
          right: -10,
          child: FloatingActionButton(
            elevation: 4,
            backgroundColor: EvrikaColors.kPrimaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.bottomToTop,
                      child: FindCustomerScreen()));
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SvgPicture.asset('$kAssetIcons/add.svg'),
            ),
          ),
        ),
      ]),
    );
  }
}
