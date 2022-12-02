import 'package:evrika_retail/bottom_date_picker.dart';
import 'package:evrika_retail/screens/add_items_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import '../consts.dart';
import '../config/evrika_colors.dart';
import '../proposal_item_widget.dart';
import '../utils.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
      child: Stack(clipBehavior: Clip.none, children: [
        Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: BottomDatePickerWidget(
                    isRange: true,
                    text: '31.01.2022 — 28.02.2022',
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
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
                      )),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const ProposalItemWidget(
                type: 'inProcess',
                color: EvrikaColors.inProcessColor,
                text: 'В процессе'),
          ],
        ),
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
                        child: const AddItemsScreen()));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SvgPicture.asset('$kAssetIcons/add.svg'),
              )),
        ),
      ]),
    );
  }
}
