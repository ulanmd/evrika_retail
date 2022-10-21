import 'package:evrika_retail/grey_label_widget.dart';
import 'package:flutter/material.dart';

class AboutOrderRowWidget extends StatelessWidget {
  const AboutOrderRowWidget(
      {Key? key, required this.title, required this.widget})
      : super(key: key);

  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: GreyLabel(
            text: title,
          ),
        ),
        Expanded(
          flex: 1,
          child: Row(
            children: [
              widget,
              Spacer()
            ],
          ),
        ),
      ],
    );
  }
}
