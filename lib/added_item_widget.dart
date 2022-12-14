import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/state/orderx.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'consts.dart';
import 'config/evrika_colors.dart';
import 'models/item.dart';

class AddedItemWidget extends StatelessWidget {
  const AddedItemWidget({Key? key, required this.item}) : super(key: key);

  final Item item;

  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderX>(context, listen: false);
    return Container(
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
          Image.network(item.attributes?.photo ?? '', width: 75, height: 75,
          errorBuilder: (context, exception, stackTrace){
            return Placeholder(
              fallbackHeight: 75,
              fallbackWidth: 75,
              color: EvrikaColors.kPrimaryColor,
            );
          },
          ),
          SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.attributes?.fullName ?? '', style: EvrikaTextStyles.darkS15W500,),
                SizedBox(
                  height: 11,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    PriceLabel(price: '100 000', fontSize: 15,),
                    Observer(
                      builder: (_) {
                        return InkWell(
                          onTap: (){
                            print('i was tapped');
                            order.removeItem(item);
                          },
                          child: SvgPicture.asset(
                            '$kAssetIcons/delete.svg',
                            width: 17,
                            height: 20,
                          ),
                        );
                      }
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
