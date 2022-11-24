import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import 'config/evrika_colors.dart';

class ExtendTimeWidget extends StatelessWidget {
  const ExtendTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tooltipController = JustTheController();
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: EvrikaColors.boxShadowColor),
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                '$kAssetIcons/sw.svg',
                height: 15,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '2д : 13ч : 51м : 32с',
                style: EvrikaTextStyles.darkS15W500,
              )
            ],
          ),
          JustTheTooltip(
            isModal: true,
            controller: tooltipController,
            child: InkWell(
              onTap: () {
                print('object');
                tooltipController.showTooltip();
              },
              child: SvgPicture.asset('$kAssetIcons/menu.svg'),
            ),
            content: Container(
              width: 180,
              height: 90,
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      tooltipController.hideTooltip();
                      _showDevelopingDialog(context);
                    },
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SvgPicture.asset('$kAssetIcons/time-forward.svg'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Продлить резерв',
                          style: TextStyle(
                              fontSize: 15, color: EvrikaColors.darkColor),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {
                      tooltipController.hideTooltip();
                      _showDeReserveDialog(context);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset('$kAssetIcons/time-out.svg'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Снять с резерва',
                          style: TextStyle(
                              fontSize: 15, color: EvrikaColors.darkColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          //
        ],
      ),
    );
  }
}

Future _showDevelopingDialog(context) {
  var width = MediaQuery.of(context).size.width;
  TextEditingController days = TextEditingController();
  TextEditingController hours = TextEditingController();
  TextEditingController minutes = TextEditingController();
  hours.value = TextEditingValue(text: '12');
  days.value = TextEditingValue(text: '12');
  minutes.value = TextEditingValue(text: '12');
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
      child: Center(
        child: Container(
          width: width * 0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.only(bottom: 20.0),
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, right: 15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            '$kAssetIcons/close.svg',
                            color: EvrikaColors.kLightGray,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Выберите время:',
                        style: EvrikaTextStyles.darkS15W500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 83,
                          height: 47,
                          child: TextFormField(
                            controller: days,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              NumericalRangeFormatter(min: 0, max: 100),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              suffix: Text(
                                'дн',
                                style: TextStyle(fontSize: 12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EvrikaColors.kPrimaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EvrikaColors.kLightGray,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                            width: 83,
                            height: 47,
                            child: TextFormField(
                                controller: hours,
                                keyboardType: TextInputType.number,
                                inputFormatters: <TextInputFormatter>[
                                  NumericalRangeFormatter(min: 0, max: 23),
                                  FilteringTextInputFormatter.digitsOnly
                                ],
                                decoration: const InputDecoration(
                                  suffix: Text(
                                    'ч',
                                    style: TextStyle(fontSize: 12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: EvrikaColors.kPrimaryColor,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: EvrikaColors.kLightGray,
                                    ),
                                  ),
                                ))),
                        SizedBox(
                          width: 83,
                          height: 47,
                          child: TextFormField(
                            controller: minutes,
                            keyboardType: TextInputType.number,
                            inputFormatters: <TextInputFormatter>[
                              NumericalRangeFormatter(min: 0, max: 59),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            decoration: const InputDecoration(
                              suffix: Text(
                                'мин',
                                style: TextStyle(fontSize: 12),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EvrikaColors.kPrimaryColor,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: EvrikaColors.kLightGray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 2,
                      color: EvrikaColors.boxShadowColor,
                    ),
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                            textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18, fontFamily: 'Nunito'),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 11, horizontal: 8),
                            child:  Text(
                              "Продлить резерв",
                              style: EvrikaTextStyles.whiteS15W500,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
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

Future _showDeReserveDialog(context) {
  var width = MediaQuery.of(context).size.width;

  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) => Center(
      child: Container(
        width: width * 0.9,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, right: 15),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: SvgPicture.asset(
                            '$kAssetIcons/close.svg',
                            color: EvrikaColors.kLightGray,
                          ),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Снятие с резерва',
                        style: EvrikaTextStyles.darkS15W500,
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 30),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Вы действительно хотите снять товары с резерва?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: EvrikaColors.darkColor,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Divider(
                      height: 2,
                      color: EvrikaColors.boxShadowColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                                  height: 40,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(padding: EdgeInsets.zero),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      'Снять с резерва',
                                      style: EvrikaTextStyles.whiteS15W500
                                    ),
                                  ))),
                          SizedBox(
                            width: 15,
                          ),
                          Expanded(
                              child: SizedBox(
                                  height: 40,
                                  child: OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        'Отменить',
                                        style: TextStyle(
                                            color: EvrikaColors.mainOrange,
                                            fontSize: 14),
                                      ))))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
