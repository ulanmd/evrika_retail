import 'dart:math';

import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import 'consts.dart';
import 'config/evrika_colors.dart';

class QuantityCounter extends StatefulWidget {
  const QuantityCounter({Key? key}) : super(key: key);

  @override
  State<QuantityCounter> createState() => _QuantityCounterState();
}

class _QuantityCounterState extends State<QuantityCounter> {
  final TextEditingController _controller = TextEditingController(text: '1');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 47,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: EvrikaColors.kLightColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              print(_controller.text);
              var decrement = int.parse(_controller.text);
              if (decrement > 1) decrement = decrement - 1;
              var newText = decrement.toString();
              final updatedText = newText;
              _controller.value = _controller.value.copyWith(
                text: updatedText,
                selection: TextSelection.collapsed(offset: updatedText.length),
              );
            },
            child: Container(
              padding: EdgeInsets.all(7),
              width: 35,
              height: double.infinity,
              decoration: BoxDecoration(
                color: EvrikaColors.kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: Transform.rotate(
                angle: pi,
                child: SvgPicture.asset(
                  '$kAssetIcons/arrow_right.svg',
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Center(
                  child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(2),
                child: TextField(
                  controller: _controller,
                  style: EvrikaTextStyles.darkS15W500,
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    NumericalRangeFormatter(min: 0, max: 99999),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              )),
            ),
          ),
          InkWell(
            onTap: () {
              print(_controller.text);
              var increment = int.parse(_controller.text);
              if (increment < 99999) increment = increment + 1;
              var newText = increment.toString();
              final updatedText = newText;
              _controller.value = _controller.value.copyWith(
                text: updatedText,
                selection: TextSelection.collapsed(offset: updatedText.length),
              );
            },
            child: Container(
              padding: EdgeInsets.all(7),
              width: 35,
              height: double.infinity,
              decoration: BoxDecoration(
                color: EvrikaColors.kPrimaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
              ),
              child: SvgPicture.asset(
                '$kAssetIcons/arrow_right.svg',
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NumericalRangeFormatter extends TextInputFormatter {
  final double min;
  final double max;

  NumericalRangeFormatter({required this.min, required this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    if (newValue.text == '') {
      return newValue;
    } else if (int.parse(newValue.text) < min) {
      return TextEditingValue().copyWith(text: min.toStringAsFixed(2));
    } else {
      return int.parse(newValue.text) > max ? oldValue : newValue;
    }
  }
}
