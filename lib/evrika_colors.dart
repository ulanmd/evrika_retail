import 'package:flutter/material.dart';

class EvrikaColors {
  static const Color kPrimaryColor = Color(0xff029aad);
  static const Color darkColor = Color.fromRGBO(0, 21, 41, 1);

  static const Color kLightColor = Color(0xffE0E0E0);
  static const Color kErrorColor = Color(0xFFB84A5D);
  static const Color kSuccessColor = Color(0xff27AE60);
  static const Color kWarningColor = Color(0xFFF2994A);
  static const Color kLightGray = Color(0xffC4C4C4);

  static const Color black = Colors.black;
  static final Color white = Color.fromRGBO(255, 255, 255, 1);
  static final Color lightBlue = Color.fromRGBO(221, 238, 242, 1);

  static final MaterialColor themePrimaryColor = MaterialColor(
    0xff029aad,
    const <int, Color>{
      50: kPrimaryColor,
      100: kPrimaryColor,
      200: kPrimaryColor,
      300: kPrimaryColor,
      400: kPrimaryColor,
      500: kPrimaryColor,
      600: kPrimaryColor,
      700: kPrimaryColor,
      800: kPrimaryColor,
      900: kPrimaryColor,
    },
  );
}
