import 'package:dotted_line/dotted_line.dart';
import 'package:evrika_retail/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'evrika_colors.dart';
import 'grey_label.dart';

class ItemBlockWidget extends StatelessWidget {
  const ItemBlockWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: EvrikaColors.boxShadowColor, width: 2),
          borderRadius: BorderRadius.circular(10)),
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 5),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Placeholder(
                fallbackWidth: 85,
                fallbackHeight: 85,
                color: EvrikaColors.kPrimaryColor,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'iPhone 13 Pro Max Blue 256GB',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          '$kAssetIcons/installation.svg',
                          width: 25,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        SvgPicture.asset(
                          '$kAssetIcons/delivery.svg',
                          width: 25,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Склад:'),
                            Text('На Севере')
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Качество:'),
                            Text('Новое')
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          DottedLine(
            dashColor: EvrikaColors.borderGreyColor,
            lineThickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
            child: Row(
              children: [
                Spacer(),
                Text('2 шт', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(
                  width: 10,
                ),
                Text('x'),
                SizedBox(
                  width: 10,
                ),
                Text(
                  '100 000₸',
                  style:
                      TextStyle(fontSize: 14, color: EvrikaColors.mainOrange, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
