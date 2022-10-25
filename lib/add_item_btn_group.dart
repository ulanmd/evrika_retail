import 'package:evrika_retail/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
            child: Container(
              child: SvgPicture.asset(
                '$kAssetIcons/qr_icon.svg', width: 16,
              ),
            ),
          )
        ),
        Expanded(
          flex: 1,
          child: OutlinedButton(
            style: ElevatedButton.styleFrom(
                primary: EvrikaColors.white,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero),
                side: BorderSide(
                    color: EvrikaColors.kPrimaryColor, width: 1)),
            onPressed: () {
            },
            child: const Icon(
              Icons.qr_code,
              color: EvrikaColors.kPrimaryColor,
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              primary: EvrikaColors.white,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                    topLeft: Radius.zero,
                    bottomLeft: Radius.zero),
              ),
              side:  const BorderSide(
                  color: EvrikaColors.kPrimaryColor, width: 1),),
            onPressed: () {},
            child: const Icon(
              Icons.category_outlined,
              color: EvrikaColors.kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
