import 'package:evrika_retail/about_delivery_tile.dart';
import 'package:evrika_retail/about_installation_tile.dart';
import 'package:evrika_retail/about_item_tile.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/modal_control_line_widget.dart';
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
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height - height),
      padding: EdgeInsets.only(bottom: 20, left: 20, right: 20),
      child: ListView(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        children: [
          Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                ModalControlLine(),
                SizedBox(
                  height: 15,
                ),
                Text(
                  'Редактирование данных',
                  style: EvrikaTextStyles.darkS17W400,
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
                              PriceLabel(
                                price: '300',
                                fontSize: 15,
                              )
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
