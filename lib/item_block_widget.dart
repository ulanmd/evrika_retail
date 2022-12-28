import 'package:dotted_line/dotted_line.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/widgets/item_title_label.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:evrika_retail/screens/discount_info_row.dart';
import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';

import 'config/evrika_colors.dart';
import 'widgets/grey_label.dart';

class ItemBlockWidget extends StatelessWidget {
  const ItemBlockWidget({Key? key, this.isOnProcess = false}) : super(key: key);

  final bool isOnProcess;

  @override
  Widget build(BuildContext context) {
    final tooltipController = JustTheController();
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
                    ItemTitleLabel(title: 'iPhone 13 Pro Max Blue 256GB'),
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
                        Spacer(),
                        isOnProcess
                            ? JustTheTooltip(
                          controller: tooltipController,
                          child: InkWell(
                            onTap: (){
                              tooltipController.showTooltip();
                            },
                            child: Container(
                              width: 102,
                              padding: EdgeInsets.symmetric(vertical: 3),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: EvrikaColors.salesBgGreyColor,
                              ),
                              child: Center(child: Text('Скидки ⓘ', style: TextStyle(
                                  fontSize: 12,
                                  color: EvrikaColors.salesTextGrayColor),)),
                            ),
                          ),
                          content: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              child: Container(
                                width: 253,
                                height: 70,
                                child: Column(
                                  children: [
                                    DiscountInfoRow(
                                      name: 'Каскад:',
                                      price: '400 ₸',
                                    ),
                                    DiscountInfoRow(
                                      name: 'Скидка:',
                                      price: '400 ₸',
                                    ),DiscountInfoRow(
                                      name: 'Скидка:',
                                      price: '400 ₸',
                                    ),
                                  ],
                                ),
                              )
                          ),
                        )
                            : Container()
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
                            GreyLabel(text: 'Склад:', fontSize: 10,),
                            Text('На Севере', style: EvrikaTextStyles.darkS12W400,)
                          ],
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GreyLabel(text: 'Качество:', fontSize: 10,),
                            Text('Новое', style: EvrikaTextStyles.darkS12W400)
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
            dashColor: EvrikaColors.kLightGray,
            lineThickness: 2,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 16, 0),
            child: Row(
              children: [
               isOnProcess ? Row(
                  children: [
                    InkWell(
                        onTap: (){},
                        child: SvgPicture.asset('$kAssetIcons/delete.svg')),
                      SizedBox(width: 20,),
                      InkWell(
                          onTap: (){
                            showEditOrder(context);
                          },
                          child: SvgPicture.asset('$kAssetIcons/edit.svg')),
                  ],
                ) : Container(),
                Spacer(),
                Text('2 шт', style: EvrikaTextStyles.darkS13W500,),
                SizedBox(
                  width: 5,
                ),
                Text('x'),
                SizedBox(
                  width: 5,
                ),
                PriceLabel(price: '100 000', fontSize: 14,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
