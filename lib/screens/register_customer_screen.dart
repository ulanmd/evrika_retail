import 'dart:io';

import '../utils/http_requests.dart';
import 'package:evrika_retail/toast.dart';
import 'package:evrika_retail/utils.dart';
import 'package:evrika_retail/widgets/required_label.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../config/evrika_colors.dart';
import '../config/evrika_text_styles.dart';

enum Gender { MALE, FEMALE, NOT_SELECTED }

//TODO Saltaga rewrite with mobx
class RegisterCustomerScreen extends StatefulWidget {
  const RegisterCustomerScreen({Key? key}) : super(key: key);

  @override
  State<RegisterCustomerScreen> createState() => _RegisterCustomerScreenState();
}

class _RegisterCustomerScreenState extends State<RegisterCustomerScreen> {
  final _formKey = GlobalKey<FormState>();

  bool? _birthdaySelected = false;
  bool? _genderSelected = false;
  DateTime? selectedDate;
  String? formattedDate;
  Gender? _gender = Gender.NOT_SELECTED;

  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _secondName = TextEditingController();
  final TextEditingController _thirdName = TextEditingController();

  void _signUp() async {
    if (_birthdaySelected == false) {
      setState(() {
        _birthdaySelected = null;
      });
    }

    if (_genderSelected == false) {
      setState(() {
        _genderSelected = null;
      });
    }

    if (selectedDate != null) {
      if (DateTime(selectedDate!.year + 18, selectedDate!.month,
                  selectedDate!.day)
              .isBefore(DateTime.now()) !=
          true) {
        setState(() {
          _birthdaySelected = null;
        });
        Toast.error(context,
            'Регистрация доступна пользователям, которым исполнилось 18 лет');
      }
    }

    if (_formKey.currentState!.validate() &&
        _birthdaySelected != null &&
        _genderSelected != null) {
      print('success');

      Map<String, String> obj = {
        "phone": ('7' + _phoneNumber.text).replaceAll(' ', ''),
        "first_name": _name.text,
        "last_name": _secondName.text,
        "middle_name": _thirdName.text,
        "birthday": formattedDate.toString(),
        "gender": _gender == Gender.MALE ? '1' : '2',
        "city_id": "6190484"
      };
      print(obj);
      Response response = await HttpRequests.registerCustomer(obj);
      print(response.statusCode);
    }
  }

  void showCupertinoDatePicker() {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 270,
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Column(
          children: [
            SizedBox(
              height: 200,
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date,
                onDateTimeChanged: (value) {
                  if (value != selectedDate) {
                    setState(() {
                      selectedDate = value;
                      _birthdaySelected = true;
                      formattedDate =
                          DateFormat('yyyy-MM-dd').format(selectedDate!);
                    });
                  }
                },
                initialDateTime: selectedDate ?? DateTime.now(),
                minimumYear: 1900,
                maximumYear: DateTime.now().year,
              ),
            ),
            CupertinoButton(
              child: const Text('Выбрать'),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      ),
    );
  }

  bool isAnonymous = false;

  @override
  Widget build(BuildContext context) {
    PhoneNumber number = PhoneNumber(isoCode: 'KZ');

    return Scaffold(
      appBar: appBarWithBackBtn(context, 'Регистрация клиента'),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 0),
          child: SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RequiredLabel(text: 'Номер телефона'),
                  SizedBox(
                    height: 10,
                  ),
                  InternationalPhoneNumberInput(
                    textFieldController: _phoneNumber,
                    errorMessage: 'Некорректный номер телефона',
                    onInputChanged: (PhoneNumber value) {},
                    initialValue: number,
                    inputDecoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        //hintText: 'Введите номер',
                        hintStyle: EvrikaTextStyles.labelGrayS15W400,
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
                    ],
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    onSaved: (PhoneNumber number) {
                      print('On Saved: $number');
                    },
                    onInputValidated: (bool value) {},
                    selectorConfig: SelectorConfig(
                        showFlags: false,
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                        setSelectorButtonAsPrefixIcon: true,
                        leadingPadding: 15,
                        trailingSpace: false),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Анонимный покупатель',
                          style: EvrikaTextStyles.darkS17W400),
                      Transform.scale(
                        scale: 0.8,
                        child: CupertinoSwitch(
                          activeColor: EvrikaColors.kPrimaryColor,
                          value: isAnonymous,
                          onChanged: (bool value) {
                            print(value);
                            setState(() {
                              isAnonymous = !isAnonymous;
                              print('from set state');
                            });
                            print(isAnonymous);
                          },
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  !isAnonymous
                      ? SingleChildScrollView(
                          physics: BouncingScrollPhysics(),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RequiredLabel(text: 'Фамилия клиента'),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _secondName,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: validateCyrillicField,
                                  textInputAction: TextInputAction.search,
                                  //  controller: controller,
                                  onFieldSubmitted: (_) async {},
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: 'Введите фамилию...',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        15.0, 10.0, 20.0, 10.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                RequiredLabel(text: 'Имя клиента'),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _name,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: validateCyrillicField,
                                  textInputAction: TextInputAction.search,
                                  onFieldSubmitted: (_) async {},
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: 'Введите имя...',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        15.0, 10.0, 20.0, 10.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'Отчество клиента',
                                  style: EvrikaTextStyles.labelGrayS12W400,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  controller: _thirdName,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: validateCyrillicFieldNotRequired,
                                  textInputAction: TextInputAction.search,
                                  onFieldSubmitted: (_) async {},
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    hintText: 'Введите отчество...',
                                    contentPadding: EdgeInsets.fromLTRB(
                                        15.0, 10.0, 20.0, 10.0),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                RequiredLabel(text: 'Дата рождения'),
                                SizedBox(height: 10),
                                SizedBox(
                                  height: 50,
                                  child: InkWell(
                                    onTap: () async {
                                      if (Platform.isAndroid) {
                                        selectedDate = await DatePicker
                                            .showSimpleDatePicker(
                                          context,
                                          initialDate:
                                              selectedDate ?? DateTime.now(),
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(
                                              DateTime.now().year + 1,
                                              DateTime.now().month,
                                              DateTime.now().day),
                                          dateFormat: "dd-MMMM-yyyy",
                                          locale: DateTimePickerLocale.ru,
                                          looping: true,
                                          titleText: '',
                                          reverse: true,
                                          confirmText: 'СОХРАНИТЬ',
                                          cancelText: 'ОТМЕНИТЬ',
                                          itemTextStyle:
                                              TextStyle(fontFamily: 'Nunito'),
                                          backgroundColor: Colors.white,
                                        );

                                        if (selectedDate != null) {
                                          setState(() {
                                            formattedDate =
                                                DateFormat('yyyy-MM-dd')
                                                    .format(selectedDate!);
                                            _birthdaySelected = true;
                                          });
                                        } else {
                                          setState(() {
                                            debugPrint("Date is not selected");
                                            _birthdaySelected = false;
                                          });
                                        }
                                      } else {
                                        showCupertinoDatePicker();
                                      }
                                    },
                                    child: Container(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.calendar_today,
                                                color: Colors.grey),
                                            SizedBox(width: 15),
                                            Text(
                                              selectedDate != null
                                                  ? DateFormat('dd.MM.yyyy')
                                                      .format(selectedDate!)
                                                  : 'Выберите дату рождения',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      1, 1, 1, 0.6),
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            width: 1,
                                            color: _birthdaySelected != null
                                                ? Colors.grey
                                                : Colors.red,
                                          ),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                RequiredLabel(text: 'Пол'),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _gender = Gender.MALE;
                                            _genderSelected = true;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 47,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                width: 1,
                                                color: _genderSelected == null
                                                    ? Colors.red
                                                    : EvrikaColors.kLightGray),
                                          ),
                                          child: Row(
                                            children: [
                                              Radio<Gender>(
                                                value: Gender.MALE,
                                                groupValue: _gender,
                                                onChanged: (Gender? value) {
                                                  print(value);
                                                  setState(() {
                                                    _gender = value;
                                                    _genderSelected = true;
                                                  });
                                                },
                                              ),
                                              Text(
                                                "Мужчина",
                                                style: EvrikaTextStyles
                                                    .darkS15W400,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Expanded(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            _gender = Gender.FEMALE;
                                            _genderSelected = true;
                                          });
                                        },
                                        child: Container(
                                          padding: EdgeInsets.only(left: 5),
                                          height: 47,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5)),
                                            border: Border.all(
                                                width: 1,
                                                color: _genderSelected == null
                                                    ? Colors.red
                                                    : EvrikaColors.kLightGray),
                                          ),
                                          child: Row(
                                            children: [
                                              Radio<Gender>(
                                                  value: Gender.FEMALE,
                                                  groupValue: _gender,
                                                  onChanged: (Gender? value) {
                                                    print(value);
                                                    setState(() {
                                                      _gender = value;
                                                      _genderSelected = true;
                                                    });
                                                  }),
                                              Text(
                                                "Женщина",
                                                style: EvrikaTextStyles
                                                    .darkS15W400,
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  ElevatedButton(
                    onPressed: _signUp,
                    child: Text(
                      'Зарегистрировать клиента',
                      style: EvrikaTextStyles.whiteS17W600,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

String? validateCyrillicField(String? value) {
  RegExp regExp = RegExp('^[\u0400-\u04FF- ]+\$');

  if (value!.isEmpty) {
    return 'Обязательное поле';
  } else if (!regExp.hasMatch(value)) {
    return 'Поле должно содержать только кириллицу';
  } else if (value.length < 2) {
    return 'Нужно больше 2 знаков';
  }

  return null;
}

String? validateCyrillicFieldNotRequired(String? value) {
  RegExp regExp = RegExp('^[\u0400-\u04FF- ]+\$');

  if (!regExp.hasMatch(value!) && value.length != 0) {
    return 'Поле должно содержать только кириллицу';
  } else if (value.length < 2 && value.length != 0) {
    return 'Нужно больше 2 знаков';
  }
  return null;
}
