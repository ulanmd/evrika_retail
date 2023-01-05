import 'package:evrika_retail/about_delivery_tile.dart';
import 'package:evrika_retail/about_installation_tile.dart';
import 'package:evrika_retail/about_item_tile.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditOrderBottomModal extends StatelessWidget {
  EditOrderBottomModal({Key? key, this.height}) : super(key: key);

  final height;

  @override
  Widget build(BuildContext context) {
    print( 'height ' + MediaQuery.of(context).size.height.toString());
    print( 'height view ' + MediaQuery.of(context).padding.top.toString());
    print(height);
    return Container(
      constraints:
      BoxConstraints(maxHeight: MediaQuery.of(context).size.height - height),
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      'Редактирование данных',
                      style: EvrikaTextStyles.darkS17W400,
                    ),
                    Spacer(),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        '$kAssetIcons/close.svg',
                        color: EvrikaColors.kLabelGrey,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Placeholder(
                          fallbackWidth: 50,
                          fallbackHeight: 50,
                        ),
                        SizedBox(
                          width: 12,
                        ),
                        SizedBox(
                          height: 50,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'iPhone 13 Pro Max',
                                style: EvrikaTextStyles.darkS15W500,
                              ),
                              Spacer(),
                              PriceLabel(price: '300', fontSize: 15,)
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    AboutItemTile(),
                    SizedBox(
                      height: 15,
                    ),
                    AboutDeliveryTile(),
                    SizedBox(
                      height: 15,
                    ),
                    AboutInstallationTile(),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Сохранить',
                        style: TextStyle(fontSize: 17),
                      ),
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
