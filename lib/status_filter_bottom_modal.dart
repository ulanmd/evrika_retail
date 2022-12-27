import 'package:evrika_retail/custom_radio_btn_group.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'config/evrika_colors.dart';
import 'utils/consts.dart';

class StatusFilterBottomModal extends StatefulWidget {
  const StatusFilterBottomModal({Key? key}) : super(key: key);

  @override
  State<StatusFilterBottomModal> createState() =>
      _StatusFilterBottomModalState();
}

class _StatusFilterBottomModalState extends State<StatusFilterBottomModal> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Row(
              children: [
                Text(
                  'Выберите статус',
                  style: TextStyle(color: EvrikaColors.darkColor, fontSize: 20),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  //style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  child: SvgPicture.asset(
                    '$kAssetIcons/close.svg',
                    color: EvrikaColors.kLabelGrey,
                  ),
                )
              ],
            ),
          ),
          StatusRadioButtonGroup(
            options: [
              'В процессе',
              'Отменена',
              'Закрыта',
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      setState(() {
                        // selectedBtn = -1;
                      });
                    },
                    child: const Text(
                      'Очистить',
                      style: TextStyle(
                        color: EvrikaColors.kPrimaryColor,
                        fontSize: 15,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  Spacer(),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.pop(context);
                  //   },
                  //   child: const Text(
                  //     'Отмена',
                  //     style: TextStyle(
                  //       color: EvrikaColors.kPrimaryColor,
                  //       fontSize: 15,
                  //
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    width: 197,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Cохранить',
                        // style: TextStyle(
                        //     color: EvrikaColors.kPrimaryColor, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

// SizedBox(
// width: double.infinity,
// child: Column(
// children: [
// InkWell(
// onTap: () {
// setState(() {
// selectedBtn = 0;
// });
// },
// child: Container(
// decoration: BoxDecoration(
// color: selectedBtn == 0
// ? EvrikaColors.filterSelectedColor
//     : Colors.white),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 12, horizontal: 30),
// child: Row(
// children: [
// Text(
// 'В процессе',
// style: EvrikaTextStyles.darkS13W400,
// ),
// Spacer(),
// selectedBtn == 0
// ? SvgPicture.asset(
// '$kAssetIcons/done.svg',
// width: 10,
// height: 13,
// )
// : Container()
// ],
// ),
// ),
// ),
// ),
// InkWell(
// onTap: () {
// setState(() {
// selectedBtn = 1;
// });
// },
// child: Container(
// decoration: BoxDecoration(
// color: selectedBtn == 1
// ? EvrikaColors.filterSelectedColor
//     : Colors.white),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 12, horizontal: 30),
// child: Row(
// children: [
// Text(
// 'Закрыта',
// style: EvrikaTextStyles.darkS13W400,
// ),
// Spacer(),
// selectedBtn == 1
// ? SvgPicture.asset(
// '$kAssetIcons/done.svg',
// width: 10,
// height: 13,
// )
// : Container()
// ],
// ),
// ),
// ),
// ),
// InkWell(
// onTap: () {
// setState(() {
// selectedBtn = 2;
// });
// },
// child: Container(
// decoration: BoxDecoration(
// color: selectedBtn == 2
// ? EvrikaColors.filterSelectedColor
//     : Colors.white),
// child: Padding(
// padding: const EdgeInsets.symmetric(
// vertical: 12, horizontal: 30),
// child: Row(
// children: [
// Text(
// 'Отмена',
// style: EvrikaTextStyles.darkS13W400,
// ),
// Spacer(),
// selectedBtn == 2
// ? SvgPicture.asset(
// '$kAssetIcons/done.svg',
// width: 10,
// height: 13,
// )
// : Container()
// ],
// ),
// ),
// ),
// )
// ],
// ),
// ),
