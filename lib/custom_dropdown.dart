import 'dart:math';

// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'consts.dart';
import 'config/evrika_colors.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({Key? key, this.isHalfScreen = false}) : super(key: key);

  final bool isHalfScreen;

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  final List<String> items = [
    'Новый',
    'Отремонтированный',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.width.toString() + 'width');

    return Container(
      height: 47,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: EvrikaColors.kLightColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset('$kAssetIcons/extend.svg'),
            ),
            isExpanded: true,
            hint: Text(
              'Выберите',
              style: TextStyle(color: Color.fromRGBO(0, 21, 41, 1)),
            ),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            items: items.map<DropdownMenuItem<String>>(
              (item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Row(
                    children: [
                      // SvgPicture.asset('assets/ic_location.svg'),
                      // SizedBox(width: 10),
                      Flexible(
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: Color.fromRGBO(0, 21, 41, 1)),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );

    // return Container(
    //   width: double.infinity,
    //   height: 47,
    //   padding: EdgeInsets.all(13),
    //   decoration: BoxDecoration(
    //     color: Colors.amber,
    //     border: Border.all(width: 1, color: EvrikaColors.kLightColor),
    //     borderRadius: BorderRadius.circular(5),
    //   ),
    //   child: DropdownButtonHideUnderline(
    //     child: DropdownButton2(
    //       icon: SvgPicture.asset('$kAssetIcons/extend.svg'),
    //       iconOnClick: Transform.rotate(
    //         angle: 180 * pi / 180,
    //         child: SvgPicture.asset(
    //           '$kAssetIcons/extend.svg',
    //         ),
    //       ),
    //       hint: Container(
    //         width: widget.isHalfScreen ? 95 : 240,
    //         child: Text(
    //           'Wanted Text 1234',
    //           overflow: TextOverflow.ellipsis,
    //         ),
    //       ),
    //       items: items
    //           .map(
    //             (item) => DropdownMenuItem<String>(
    //               value: item,
    //               child: Column(
    //                 children: [
    //                   Flexible(
    //                     child: Text(
    //                       item,
    //                       overflow: TextOverflow.clip,
    //                       style: const TextStyle(
    //                         fontSize: 14,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           )
    //           .toList(),
    //       value: selectedValue,
    //       onChanged: (value) {
    //         setState(() {
    //           selectedValue = value as String;
    //         });
    //       },
    //       buttonHeight: 40,
    //       buttonWidth: 140,
    //       itemHeight: 40,
    //     ),
    //   ),
    // );
  }
}
