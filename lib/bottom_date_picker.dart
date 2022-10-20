import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'consts.dart';
import 'evrika_colors.dart';

class BottomDatePickerWidget extends StatelessWidget {
  const BottomDatePickerWidget({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showBottomDatePicker(context);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: EvrikaColors.kLightGray,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(15),
        child: Row(
          children: [
            SvgPicture.asset('$kAssetIcons/calendar.svg'),
            SizedBox(
              width: 10,
            ),
            Text(
              'Дата',
            //  '21.11.2022 - 23.11.2022',
              style: TextStyle(fontSize: 15, color: EvrikaColors.kLabelGrey),
            ),
            Spacer(),
            SvgPicture.asset('$kAssetIcons/open.svg')
          ],
        ),
      ),
    );
  }
}
