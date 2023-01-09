import 'package:evrika_retail/about_order_options.dart';
import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/delivery_option_bottom_modal.dart';
import 'package:evrika_retail/screens/payment_widget.dart';
import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/price_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../config/evrika_colors.dart';
import '../quantity_counter.dart';
import '../widgets/grey_label.dart';

class CreatingOrderScreen extends StatefulWidget {
  const CreatingOrderScreen({Key? key}) : super(key: key);

  @override
  State<CreatingOrderScreen> createState() => _CreatingOrderScreenState();
}

class _CreatingOrderScreenState extends State<CreatingOrderScreen> {
  bool check1 = false;
  bool check2 = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Создание заявки'),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            index == 1
                ? Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  index = 0;
                                });
                              },
                              child: Text(
                                'Информация о товаре',
                                style: EvrikaTextStyles.lightGrayS12W400,
                              )),
                          SizedBox(
                            width: 4,
                          ),
                          SvgPicture.asset(
                            '$kAssetIcons/arrow_right.svg',
                            width: 3,
                            height: 5,
                            color: EvrikaColors.kLabelGrey,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Выбор способа оплаты',
                            style: EvrikaTextStyles.primaryS12W500,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  )
                : Container(),
            Expanded(
              child: SingleChildScrollView(
                child: IndexedStack(
                  index: index,
                  children: [
                    Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1, color: EvrikaColors.kLightColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Theme(
                            data: Theme.of(context)
                                .copyWith(dividerColor: Colors.transparent),
                            child: ExpansionTile(
                              title: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 5),
                                child: Row(
                                  children: [
                                    Placeholder(
                                      fallbackHeight: 50,
                                      fallbackWidth: 50,
                                    ),
                                    SizedBox(
                                      width: 8,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text(
                                          'iPhone 14 Pro Max 1Tb',
                                          style: EvrikaTextStyles.darkS15W500,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        PriceLabel(
                                          price: '900 000',
                                          fontSize: 15,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              trailing: InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 5),
                                  child: SvgPicture.asset(
                                      '$kAssetIcons/extend.svg'),
                                ),
                              ),
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GreyLabel(
                                        text: 'Cклад:',
                                        fontSize: 12,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          showBottomOptions(
                                              context, 'Выберите склад', [
                                            'Север',
                                            'Жанегельдина',
                                            'Аэропорт'
                                          ]);
                                        },
                                        child: Container(
                                          height: 47,
                                          padding: EdgeInsets.all(15),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                                width: 1,
                                                color:
                                                    EvrikaColors.kLightColor),
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Выберите склад',
                                                style: EvrikaTextStyles
                                                    .darkS15W400,
                                              ),
                                              Spacer(),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 5),
                                                child: SvgPicture.asset(
                                                    '$kAssetIcons/extend.svg'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 9,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GreyLabel(
                                                  text: 'Качество:',
                                                  fontSize: 12,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    showBottomOptions(context,
                                                        'Выберите качество', [
                                                      'Новое',
                                                      'Витрина',
                                                      'Б/У'
                                                    ]);
                                                  },
                                                  child: Container(
                                                    height: 47,
                                                    padding: EdgeInsets.all(15),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                          width: 1,
                                                          color: EvrikaColors
                                                              .kLightColor),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Новое',
                                                          style:
                                                              EvrikaTextStyles
                                                                  .darkS15W400,
                                                        ),
                                                        Spacer(),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 5),
                                                          child: SvgPicture.asset(
                                                              '$kAssetIcons/extend.svg'),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                // CustomDropdown(
                                                //   isHalfScreen: true,
                                                // ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            flex: 10,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                GreyLabel(
                                                  text: 'Количество:',
                                                  fontSize: 12,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                QuantityCounter()
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        EvrikaColors.kLightGray,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15,
                                                            bottom: 15,
                                                            left: 17,
                                                            right: 10),
                                                    child: SizedBox(
                                                      width: 20,
                                                      height: 20,
                                                      child: Checkbox(
                                                          fillColor: MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                          side:
                                                              MaterialStateBorderSide
                                                                  .resolveWith(
                                                                      (states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .pressed)) {
                                                              return BorderSide(
                                                                  color: EvrikaColors
                                                                      .kPrimaryColor);
                                                            } else {
                                                              return BorderSide(
                                                                  color: EvrikaColors
                                                                      .kPrimaryColor);
                                                            }
                                                          }),
                                                          checkColor:
                                                              EvrikaColors
                                                                  .kPrimaryColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          activeColor:
                                                              EvrikaColors
                                                                  .white,
                                                          focusColor:
                                                              EvrikaColors
                                                                  .white,
                                                          value: check1,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              check1 = value!;
                                                              if (check1)
                                                                showDeliveryOptions(
                                                                    context);
                                                            });
                                                          }),
                                                    ),
                                                  ),
                                                  Text(
                                                    'С доставкой',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: EvrikaColors
                                                            .darkColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color:
                                                        EvrikaColors.kLightGray,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 15,
                                                            bottom: 15,
                                                            left: 17,
                                                            right: 10),
                                                    child: SizedBox(
                                                      width: 17,
                                                      height: 17,
                                                      child: Checkbox(
                                                          fillColor: MaterialStateProperty
                                                              .all(Colors
                                                                  .transparent),
                                                          side:
                                                              MaterialStateBorderSide
                                                                  .resolveWith(
                                                                      (states) {
                                                            if (states.contains(
                                                                MaterialState
                                                                    .pressed)) {
                                                              return BorderSide(
                                                                  color: EvrikaColors
                                                                      .kPrimaryColor);
                                                            } else {
                                                              return BorderSide(
                                                                  color: EvrikaColors
                                                                      .kPrimaryColor);
                                                            }
                                                          }),
                                                          checkColor:
                                                              EvrikaColors
                                                                  .kPrimaryColor,
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5)),
                                                          activeColor:
                                                              EvrikaColors
                                                                  .white,
                                                          focusColor:
                                                              EvrikaColors
                                                                  .white,
                                                          value: check2,
                                                          onChanged:
                                                              (bool? value) {
                                                            setState(() {
                                                              check2 = value!;
                                                              //  if (check1) _showBottomAddressFrom();
                                                            });
                                                          }),
                                                    ),
                                                  ),
                                                  const Text(
                                                    'С установкой',
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        color: EvrikaColors
                                                            .darkColor),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      AboutOrderOptions(),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      AboutOrderOptions(),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                index = 1;
                              });
                              print('object + $index');
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => const PaymentScreen()),
                              // );
                            },
                            child: Text(
                              'Перейти к выбору оплаты',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        )
                      ],
                    ),
                    PaymentWidget()
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
