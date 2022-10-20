import 'package:flutter/material.dart';

import 'date_picker_bottom_modal.dart';

void showBottomDatePicker(context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      builder: (context) => const DatePickerBottomModal());
}