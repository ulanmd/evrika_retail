import 'package:evrika_retail/screens/category_search_screen.dart';
import 'package:evrika_retail/screens/input_search_screen.dart';
import 'package:evrika_retail/screens/qr_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';


import 'evrika_colors.dart';

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
              child: Icon(
                Icons.search,
                color: EvrikaColors.kPrimaryColor,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: InkWell(
            onTap: (){
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  child: QRViewExample(),
                ),
              );
            },
            child: Container(
                padding: EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  border: Border(
                    top:
                        BorderSide(color: EvrikaColors.kPrimaryColor, width: 1),
                    bottom:
                        BorderSide(color: EvrikaColors.kPrimaryColor, width: 1),
                  ),
                ),
                child: Icon(
                  Icons.qr_code_outlined,
                  color: EvrikaColors.kPrimaryColor,
                )),
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
              child: Icon(
                Icons.category_outlined,
                color: EvrikaColors.kPrimaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
