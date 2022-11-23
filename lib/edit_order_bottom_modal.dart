import 'package:evrika_retail/about_delivery_tile.dart';
import 'package:evrika_retail/about_installation_tile.dart';
import 'package:evrika_retail/about_item_tile.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/config/evrika_colors.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditOrderBottomModal extends StatelessWidget {
  const EditOrderBottomModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20, bottom: 20, left: 20, right: 20),
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.85),
      //height: MediaQuery.of(context).size.height * 0.85,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Редактирование данных',
                style: TextStyle(color: EvrikaColors.darkColor, fontSize: 20),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
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
                              style: TextStyle(
                                  color: EvrikaColors.darkColor, fontSize: 15),
                            ),
                            Spacer(),
                            PriceLabel(price: '300')
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
            ),
          ),
        ],
      ),
    );
  }
}
