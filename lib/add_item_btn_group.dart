import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/screens/category_search_screen.dart';
import 'package:evrika_retail/screens/input_search_screen.dart';
import 'package:evrika_retail/screens/qr_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

import 'config/evrika_colors.dart';

class AddItemBtnGroup extends StatelessWidget {
  const AddItemBtnGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: InputSearchScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: EvrikaColors.kPrimaryColor),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5)),
              ),
              child: SvgPicture.asset(
                '$kAssetIcons/search_btn.svg',
                color: EvrikaColors.kPrimaryColor,
                height: 18,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: QrScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: EvrikaColors.kPrimaryColor, width: 1),
                  bottom:
                      BorderSide(color: EvrikaColors.kPrimaryColor, width: 1),
                ),
              ),
              child: SvgPicture.asset(
                '$kAssetIcons/qr_btn.svg',
                height: 18,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: CategorySearchScreen(),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: EvrikaColors.kPrimaryColor),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: SvgPicture.asset(
                '$kAssetIcons/categories.svg',
                height: 18,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
