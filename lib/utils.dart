import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/edit_address_widget.dart';
import 'package:evrika_retail/edit_order_bottom_modal.dart';
import 'package:evrika_retail/options_bottom_modal.dart';
import 'package:evrika_retail/status_filter_bottom_modal.dart';
import 'package:evrika_retail/widgets/bottom_modal_sheet_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:status_bar_control/status_bar_control.dart';

import 'utils/consts.dart';
import 'date_picker_bottom_modal.dart';

void showBottomDatePicker(context, isRange) async {
  double height = await StatusBarControl.getHeight;
  bottomModalWidgetMethod(
      scrollControlled: true,
      context: context,
      builder: (context) => DatePickerBottomModal(
            isRange: isRange,
            height: height,
          ));
  // showMaterialModalBottomSheet(
  //   context: context,
  //   expand: true,
  //   shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
  //   builder: (context) => SafeArea(
  //     child: SingleChildScrollView(
  //       controller: ModalScrollController.of(context),
  //       child: Container(
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.all(Radius.circular(10)),
  //           color: Colors.red,
  //         ),
  //         width: 100,
  //         height: 100,
  //       ),
  //     ),
  //   ),
  // );
}

void showBottomStatusFilter(context) {
  bottomModalWidgetMethod(
      context: context,
      builder: (context) => StatusFilterBottomModal());
}

void showBottomOptions(context, String label, List<String> options) {
  bottomModalWidgetMethod(
      context: context,
      builder: (context) => OptionsBottomModal(label: label, options: options));
}

void showEditOrder(context) async {
  double height = await StatusBarControl.getHeight;
  bottomModalWidgetMethod(
      scrollControlled: true,
      context: context,
      builder: (context) => EditOrderBottomModal(
            height: height,
          ));
}

void showEditAddress(context) {
  bottomModalWidgetMethod(
      scrollControlled: true,
      context: context,
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
      title: Text(
        title,
        style: EvrikaTextStyles.darkS20W500,
      ),
    );
