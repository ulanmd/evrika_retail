import 'package:flutter/cupertino.dart';

import '../config/evrika_colors.dart';
import 'grey_label.dart';

class RequiredLabel extends StatelessWidget {
  const RequiredLabel({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GreyLabel(text: '$text:', fontSize: 12,),
        Text(
          '*',
          style: TextStyle(color: EvrikaColors.otherRedColor),
        )
      ],
    );
  }
}
