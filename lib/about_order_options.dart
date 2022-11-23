import 'package:evrika_retail/delivery_option_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'consts.dart';
import 'config/evrika_colors.dart';

class AboutOrderOptions extends StatelessWidget {
  const AboutOrderOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: EvrikaColors.boxShadowColor),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Информация о доставке',
                style:
                    TextStyle(color: EvrikaColors.kPrimaryColor, fontSize: 13),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  showDeliveryOptions(context);
                },
                child: SvgPicture.asset('$kAssetIcons/edit.svg'),
              )
            ],
          ),
          SizedBox(
            height: 17,
          ),
          Row(
            children: [
              SvgPicture.asset(
                '$kAssetIcons/location.svg',
                color: EvrikaColors.kLabelGrey,
                width: 10,
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Text(
                  'Шымкент қаласы, Байтұрсынов көшесі, 18, 3 қабат',
                  maxLines: 2,
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    InkWell(
                        child: SvgPicture.asset(
                      '$kAssetIcons/phone.svg',
                      width: 10,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Text('+7 777 202 45 54')
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    InkWell(
                        child: SvgPicture.asset(
                      '$kAssetIcons/phone.svg',
                      width: 10,
                    )),
                    SizedBox(
                      width: 10,
                    ),
                    Text('+7 777 202 45 54')
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    InkWell(
                        child: SvgPicture.asset('$kAssetIcons/additional.svg')),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(child: Text('from scrum business center'))
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    InkWell(child: SvgPicture.asset('$kAssetIcons/clock.svg')),
                    SizedBox(
                      width: 10,
                    ),
                    Text('17:00 - 21:00')
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
