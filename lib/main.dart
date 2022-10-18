import 'package:evrika_retail/screens/login_screen.dart';
import 'package:evrika_retail/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'evrika_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Evrika Retail',
      theme: evrikaTheme,
      home: LoginScreen(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/main':
            return PageTransition(child:
            MainScreen(),
                duration: const Duration(milliseconds: 250),
                type: PageTransitionType.bottomToTop,);
            break;
          default:
            return null;
        }
      },
    );
  }
}

