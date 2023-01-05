import 'package:evrika_retail/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'config/evrika_text_styles.dart';
import 'utils/consts.dart';
import 'config/evrika_colors.dart';

class BottomDatePickerWidget extends StatefulWidget {
  const BottomDatePickerWidget({
    Key? key, required this.isRange, required this.text,
  }) : super(key: key);

  final bool isRange;
  final String text;

  @override
  State<BottomDatePickerWidget> createState() => _BottomDatePickerWidgetState();
}

class _BottomDatePickerWidgetState extends State<BottomDatePickerWidget> {
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () async{
         showBottomDatePicker(context, widget.isRange);
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
            SvgPicture.asset('$kAssetIcons/calendar.svg', color: EvrikaColors.kPrimaryColor,),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}',
              //widget.text,
            //  '21.11.2022 - 23.11.2022',
            style: EvrikaTextStyles.darkS15W400,
              //style: EvrikaTextStyles.lightGrayS15W400,
            ),
          ],
        ),
      ),
    );
  }
}
