import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/delivery_option_bottom_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'utils/consts.dart';
import 'config/evrika_colors.dart';

class AboutOrderOptions extends StatelessWidget {
  const AboutOrderOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: EvrikaColors.boxShadowColor,
          borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Информация о доставке',
                style: EvrikaTextStyles.primaryS13W500,
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
                  style: EvrikaTextStyles.darkS12W400,
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
                    Text(
                      '+7 777 202 45 54',
                      style: EvrikaTextStyles.darkS12W400,
                    )
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
                    Text(
                      '+7 777 202 45 54',
                      style: EvrikaTextStyles.darkS12W400,
                    )
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
                    Expanded(
                        child: Text(
                      'from scrum business center',
                      style: EvrikaTextStyles.darkS12W400,
                    ))
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
                    Text(
                      '17:00 - 21:00',
                      style: EvrikaTextStyles.darkS12W400,
                    )
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
