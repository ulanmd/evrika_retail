import 'package:evrika_retail/custom_radio_btn_group.dart';
import 'package:evrika_retail/modal_control_line_widget.dart';
import 'package:evrika_retail/modal_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'config/evrika_colors.dart';
import 'config/evrika_text_styles.dart';
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
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10,),
          ModalControlLine(),
          SizedBox(height: 15,),
          Stack(
            alignment: Alignment.center,
            children: [
              Center(
                  child: Text(
                    'Выберите дату',
                    style: EvrikaTextStyles.darkS20W600,
                  )),
              Positioned(
                  right: 20,
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'Очистить',
                      style: EvrikaTextStyles.primaryS16W600,
                    ),
                  ))
            ],
          ),
          SizedBox(height: 20,),
          ModalDivider(),
          StatusRadioButtonGroup(
            options: [
              'В процессе',
              'Отменена',
              'Закрыта',
            ],
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
