import 'package:evrika_retail/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

import '../evrika_colors.dart';

class ExtendTimeWidget extends StatelessWidget {
  const ExtendTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: EvrikaColors.boxShadowColor),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 26),
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
                style: TextStyle(
                  fontSize: 15,
                  color: EvrikaColors.darkColor,
                ),
              )
            ],
          ),
          OutlinedButton(
            onPressed: () {
              _showDevelopingDialog(context);
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: EvrikaColors.kPrimaryColor),
            ),
            child: Text(
              'Продлить резерв',
              style: TextStyle(fontSize: 13, color: EvrikaColors.kPrimaryColor),
            ),
          )
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
          width: width*0.9,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                margin: EdgeInsets.only(bottom: 20.0),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Выберите время:',
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(
                            width: 60,
                          ),
                          TextButton(
                              onPressed: () { Navigator.pop(context);},
                              child: SvgPicture.asset('$kAssetIcons/close.svg', color: EvrikaColors.kLabelGrey,))
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                              width: 83,
                              child: TextFormField(
                                  controller: days,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    NumericalRangeFormatter(min: 0, max: 100),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    suffix: Text('дн', style: TextStyle(fontSize: 12),),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: EvrikaColors.kPrimaryColor,),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: EvrikaColors.borderGreyColor,),
                                    ),
                                  )
                              )
                          ),
                          SizedBox(
                              width: 83,
                              child: TextFormField(
                                  controller: hours,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    NumericalRangeFormatter(min: 0, max: 23),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    suffix: Text('ч', style: TextStyle(fontSize: 12),),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: EvrikaColors.kPrimaryColor,),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: EvrikaColors.borderGreyColor,),
                                    ),
                                  )
                              )
                          ),
                          SizedBox(
                              width: 83,
                              child: TextFormField(
                                  controller: minutes,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: <TextInputFormatter>[
                                    NumericalRangeFormatter(min: 0, max: 59),
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  decoration: const InputDecoration(
                                    suffix: Text('мин', style: TextStyle(fontSize: 12),),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: EvrikaColors.kPrimaryColor,),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: EvrikaColors.borderGreyColor,),
                                    ),
                                  )
                              )
                          )
                        ],
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: ElevatedButton(style: ButtonStyle(
                          minimumSize: MaterialStateProperty.all(
                            Size(147, 31),
                          ),
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
                            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                            child: const Text("Продлить резерв",
                              style: TextStyle(
                                  height: 1,
                                  fontSize: 13),),
                          ),
                        ),
                      ),
                    ],
                  ),
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