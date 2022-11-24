import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'consts.dart';
import 'config/evrika_colors.dart';

class AddedItemWidget extends StatelessWidget {
  const AddedItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return           Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: EvrikaColors.kLightGray),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Placeholder(
            fallbackHeight: 75,
            fallbackWidth: 75,
            color: EvrikaColors.kPrimaryColor,
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('iPhone 13 Pro Max Blue 256GB', style: EvrikaTextStyles.darkS15W500,),
                SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceLabel(price: '100 000', fontSize: 15,),
                    SvgPicture.asset(
                      '$kAssetIcons/delete.svg',
                      width: 17,
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
