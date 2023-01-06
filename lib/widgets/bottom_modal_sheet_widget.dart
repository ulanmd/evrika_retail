import 'package:flutter/material.dart';

void bottomModalWidgetMethod(
    {required dynamic context,
    bool scrollControlled = false,
    double borderRadius = 10,
    required Widget Function(BuildContext) builder}) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: scrollControlled,
      shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.vertical(top: Radius.circular(borderRadius))),
      builder: builder);
}
