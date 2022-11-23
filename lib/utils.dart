import 'package:evrika_retail/edit_address_widget.dart';
import 'package:evrika_retail/edit_order_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'consts.dart';
import 'date_picker_bottom_modal.dart';
import 'config/evrika_colors.dart';

void showBottomDatePicker(context, isRange) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) =>  DatePickerBottomModal(isRange: isRange,));
}


void showEditOrder(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const EditOrderBottomModal(),
      ));
}

void showEditAddress(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const EditAddressWidget(),
      ));
}



AppBar appBarWithBackBtn(context, title) => AppBar(
  systemOverlayStyle: SystemUiOverlayStyle.dark,
  centerTitle: true,
  backgroundColor: Colors.transparent,

  elevation: 0,
  leading: IconButton(
    icon: SvgPicture.asset('$kAssetIcons/back.svg'),
    onPressed: () => Navigator.of(context).pop(),
  ),
  title: Text(title, style: TextStyle(color: EvrikaColors.darkColor),
  ),
);