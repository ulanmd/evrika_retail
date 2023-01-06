import 'package:evrika_retail/custom_radio_btn_group.dart';
import 'package:evrika_retail/modal_control_line_widget.dart';
import 'package:evrika_retail/modal_divider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'config/evrika_colors.dart';
import 'utils/consts.dart';

class OptionsBottomModal extends StatelessWidget {
  const OptionsBottomModal(
      {Key? key, required this.label, required this.options})
      : super(key: key);

  final String label;
  final List<String> options;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 10,
          ),
          ModalControlLine(),
          SizedBox(
            height: 15,
          ),
          Text(
            label,
            style: TextStyle(color: EvrikaColors.darkColor, fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          ModalDivider(),
          StatusRadioButtonGroup(
            options: options,
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity,
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