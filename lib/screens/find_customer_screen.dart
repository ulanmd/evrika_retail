import 'dart:convert';

import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/screens/add_items_screen.dart';
import 'package:evrika_retail/screens/register_customer_screen.dart';
import 'package:evrika_retail/state/loading.dart';
import 'package:evrika_retail/state/screens/find_customerx.dart';
import 'package:evrika_retail/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:page_transition/page_transition.dart';

import '../utils/http_requests.dart';

import '../config/evrika_colors.dart';
import '../utils/consts.dart';

class FindCustomerScreen extends StatelessWidget {
  const FindCustomerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var findCustomState = FindCustomerX();
    var loading = Loading();
    Widget iconOfTextField() {
      if (findCustomState.iconOfNumberInput == 1) {
        return Padding(
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset('$kAssetIcons/customer-found.svg'),
        );
      }

      if (findCustomState.iconOfNumberInput == 2) {
        return Padding(
          padding: EdgeInsets.all(15),
          child: SvgPicture.asset('$kAssetIcons/customer-not-found.svg'),
        );
      }

      return Padding(
        padding: EdgeInsets.all(15),
        child: SvgPicture.asset(
          '$kAssetIcons/customer-not-found.svg',
          color: Colors.transparent,
        ),
      );
    }

    final phoneController = TextEditingController();
    var phoneFocusNode = FocusNode();

    PhoneNumber number = PhoneNumber(isoCode: 'KZ');
    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Авторизация'),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Observer(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Номер телефона:',
                style: EvrikaTextStyles.labelGrayS12W400,
              ),
              SizedBox(
                height: 10,
              ),
              InternationalPhoneNumberInput(
                maxLength: 12,
                errorMessage: 'Некорректный номер телефона',
                onInputChanged: (PhoneNumber value) {
                  findCustomState.setClientNumber(value.phoneNumber.toString());
                  findCustomState.setIconOfNumberInput(0);
                },
                initialValue: number,
                textFieldController: phoneController,
                focusNode: phoneFocusNode,
                inputDecoration: InputDecoration(
                    hintText: 'Введите номер',
                    hintStyle: EvrikaTextStyles.labelGrayS15W400,
                    suffixIcon: iconOfTextField(),
                    border: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(5.0),
                        ),
                        borderSide:
                            BorderSide(color: EvrikaColors.kPrimaryColor)),
                    focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: EvrikaColors.kPrimaryColor))),
                countries: [
                  'KZ',
                  'RU',
                  'UZ',
                  'CN',
                  'KG',
                  'US',
                  'TJ',
                  'GE',
                  'BY',
                  'UA'
                ],
                autoValidateMode: AutovalidateMode.onUserInteraction,
                onSaved: (PhoneNumber number) {
                  print('On Saved: $number');
                },
                onInputValidated: (bool value) {
                  findCustomState.setCorrectNumber(value);
                },
                selectorConfig: SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                    setSelectorButtonAsPrefixIcon: true,
                    leadingPadding: 7,
                    trailingSpace: false),
              ),
              SizedBox(
                height: 30,
              ),
              findCustomState.iconOfNumberInput == 1
                  ? Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Клиент:',
                                    style: EvrikaTextStyles.labelGrayS12W400,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    'Марина Редина',
                                    style: EvrikaTextStyles.darkS15W400,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Бонусы:',
                                    style: EvrikaTextStyles.labelGrayS12W400,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '5 000 ₸',
                                    style: EvrikaTextStyles.primaryS15W400,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    )
                  : Container(),
              (findCustomState.iconOfNumberInput != 1 &&
                      findCustomState.iconOfNumberInput != 2)
                  ? SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: findCustomState.correctNumber
                            ? () async {
                                loading.setLoading(true);
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                print(findCustomState.clientNumber);
                                Response response =
                                    await HttpRequests.getCustomerByPhoneNumber(
                                        findCustomState.clientNumber
                                            .substring(1));
                                print(response.statusCode);

                                if (response.statusCode == 200 &&
                                    !(jsonDecode(
                                            response.body)['status_code'] ==
                                        400)) {
                                  findCustomState.setIconOfNumberInput(1);
                                } else {
                                  findCustomState.setIconOfNumberInput(2);
                                }
                                loading.setLoading(false);
                              }
                            : null,
                        child: loading.isLoading
                            ? SizedBox(
                                height: 15,
                                width: 15,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                  color: Colors.white,
                                ),
                              )
                            : Text(
                                'Проверить',
                                style: EvrikaTextStyles.whiteS15W500,
                              ),
                      ),
                    )
                  : Container(),
              findCustomState.iconOfNumberInput == 1
                  ? SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: AddItemsScreen()));
                        },
                        child: Text(
                          'Перейти к выбору товаров',
                          style: EvrikaTextStyles.whiteS15W500,
                        ),
                      ),
                    )
                  : Container(),
              findCustomState.iconOfNumberInput == 2
                  ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.bottomToTop,
                                  child: RegisterCustomerScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Зарегистрировать клиента',
                              style: EvrikaTextStyles.whiteS15W500,
                            ),
                          ),
                        ),
                      SizedBox(height: 5,),
                      Text('Клиент не зарегистрирован', style: EvrikaTextStyles.cancelledS12W500,),
                    ],
                  )
                  : Container(),
              (findCustomState.iconOfNumberInput == 2 ||
                      findCustomState.iconOfNumberInput == 1)
                  ? Align(
                      alignment: Alignment.centerRight,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              findCustomState.setIconOfNumberInput(0);
                              FocusScope.of(context)
                                  .requestFocus(phoneFocusNode);
                            },
                            child: Text('Изменить номер', style: EvrikaTextStyles.primaryS13W500,),
                          )
                        ],
                      ),
                    )
                  : Container(),
            ],
          );
        }),
      ),
    );
  }
}

// InternationalPhoneNumberInput(
// onInputChanged: (PhoneNumber number) {
// print(number.phoneNumber);
// },
// onInputValidated: (bool value) {
// print(value);
// },
// countries: ['KZ', 'UZ', 'KG', 'RU', 'UA', 'BY', 'TJ', 'TR', 'IN'],
// selectorConfig: SelectorConfig(
// selectorType: PhoneInputSelectorType.DROPDOWN,
// setSelectorButtonAsPrefixIcon: false,
// trailingSpace: false),
// cursorColor: EvrikaColors.kPrimaryColor,
// ignoreBlank: false,
// inputDecoration: InputDecoration(
// hintText: 'Введите номер телефона',
// hintStyle: EvrikaTextStyles.lightGrayS15W400,
// border: OutlineInputBorder(
// borderRadius: const BorderRadius.all(
// const Radius.circular(10.0),
// ),
// borderSide: BorderSide(color: EvrikaColors.kPrimaryColor),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: EvrikaColors.kPrimaryColor),
// ),
// ),
// autoValidateMode: AutovalidateMode.onUserInteraction,
// selectorTextStyle: TextStyle(color: Colors.black),
// initialValue: number,
// textFieldController: controller,
// formatInput: false,
// keyboardType:
// TextInputType.numberWithOptions(signed: true, decimal: true),
// inputBorder: OutlineInputBorder(),
// onSaved: (PhoneNumber number) {
// print('On Saved: $number');
// },
// ),
