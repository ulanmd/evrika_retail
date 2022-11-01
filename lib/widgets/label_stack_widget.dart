import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LabelStackWidget extends StatelessWidget {
  const LabelStackWidget({Key? key, required this.type, required this.color, required this.text}) : super(key: key);

  final String? type;
  final Color? color;

  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/img/${type}Label.svg', width: 80,),
        Positioned(
          top: 11,
            left: 12.5,
            child: Text(text,
            style: TextStyle(fontSize: 10, color: color),
            ),
        )
      ],
    );
  }
}
