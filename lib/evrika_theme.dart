
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'evrika_colors.dart';

AppBarTheme _appBarTheme = AppBarTheme(
  systemOverlayStyle: SystemUiOverlayStyle.light,
  elevation: 0.0,
  // backgroundColor: EvrikaColors.kPrimaryColor,
  // iconTheme: IconThemeData(
  //   color: EvrikaColors.kPrimaryColor,
  // ),
  // titleTextStyle: EvrikaTextStyles.blackS13W500,
);

ElevatedButtonThemeData _elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ButtonStyle(
    minimumSize: MaterialStateProperty.all(
      Size(double.infinity, 50),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    textStyle: MaterialStateProperty.all(
      TextStyle(fontSize: 18, fontFamily: 'Nunito'),
    ),
  ),
);

OutlinedButtonThemeData _outlinedButtonThemeData = OutlinedButtonThemeData(
  style: ButtonStyle(
    side: MaterialStateProperty.all(
      BorderSide(
        color: EvrikaColors.kPrimaryColor,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
    textStyle: MaterialStateProperty.all(
      TextStyle(fontSize: 18, fontFamily: 'Nunito'),
    ),
  ),
);

InputDecorationTheme _inputDecorationTheme = InputDecorationTheme(
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

final ThemeData evrikaTheme = ThemeData(
  primarySwatch: EvrikaColors.themePrimaryColor,
  inputDecorationTheme: _inputDecorationTheme,
  appBarTheme: _appBarTheme,
  textTheme: GoogleFonts.nunitoTextTheme(),
  elevatedButtonTheme: _elevatedButtonThemeData,
  outlinedButtonTheme: _outlinedButtonThemeData,
);
