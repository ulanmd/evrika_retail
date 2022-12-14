import 'dart:convert';

import 'package:evrika_retail/screens/login_screen.dart';
import 'package:evrika_retail/screens/main_screen.dart';
import 'package:evrika_retail/screens/online_orders_screen.dart';
import 'package:evrika_retail/state/auth.dart';
import 'package:evrika_retail/state/categories.dart';
import 'package:evrika_retail/state/loading.dart';
import 'package:evrika_retail/state/orderx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/evrika_theme.dart';
import 'models/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  var userData = await sp.getStringList('userData');
  var categories = await sp.getString('categories');
  runApp(
    MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
        ),
        Provider<Categories>(
          create: (_) => Categories(),
        ),
        Provider<Loading>(create: (_) => Loading()),
        Provider<OrderX>(create: (_) => OrderX())
      ],
      child: MyApp(
        userData: userData,
        categories: categories,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.userData, required this.categories})
      : super(key: key);

  final List<String>? userData;
  final String? categories;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final categoriesState = Provider.of<Categories>(context, listen: false);
    //print(sp.getString('accessToken').toString());
    print('from main ${userData}');
    print('from main ${userData.runtimeType}');
    print('isAuth: ' + auth.isAuth.toString());

    int userDataLen = userData?[0].length ?? 0;
    int categoriesLen = categories?.length ?? 0;
    if (userDataLen > 4) {
      auth.initLogin(userData![2], userData![1]);
    }
    if (categoriesLen > 4) {
      var cats = jsonDecode(categories!);
      Category newCat = Category.fromJson(cats[0]);
      categoriesState.setNewCat(newCat);
      categoriesState.steps[1] = [newCat];
    }
    return MaterialApp(
      title: 'Evrika Retail',
      theme: evrikaTheme,
      home: Observer(builder: (_) {
        return auth.isAuth ? MainScreen() : LoginScreen();
      }),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/main':
            return PageTransition(
              child: MainScreen(),
              duration: const Duration(milliseconds: 250),
              type: PageTransitionType.bottomToTop,
            );
            break;
          case '/online_order':
            return PageTransition(
              child: OnlineOrderScreen(),
              duration: const Duration(milliseconds: 250),
              type: PageTransitionType.bottomToTop,
            );
            break;
          default:
            return null;
        }
      },
    );
  }
}
