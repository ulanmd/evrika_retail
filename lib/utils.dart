import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/edit_address_widget.dart';
import 'package:evrika_retail/edit_order_bottom_modal.dart';
import 'package:evrika_retail/options_bottom_modal.dart';
import 'package:evrika_retail/status_filter_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'consts.dart';
import 'date_picker_bottom_modal.dart';

void showBottomDatePicker(context, isRange) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => DatePickerBottomModal(
            isRange: isRange,
          ));
}

void showBottomStatusFilter(context) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (context) => StatusFilterBottomModal(),
  );
}

void showBottomOptions(context, String label, List<String> options) {
  showModalBottomSheet(
    context: context,
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
    builder: (context) => OptionsBottomModal(label: label, options: options),
  );
}

void showEditOrder(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      builder: (context) => const EditOrderBottomModal());
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
      title: Text(
        title,
        style: EvrikaTextStyles.darkS20W500,
      ),
    );
