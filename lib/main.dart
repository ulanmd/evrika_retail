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
import './utils/http_client.dart';

import 'config/evrika_theme.dart';
import 'models/category.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  String token = sp.getString('accessToken') ?? '';
  String employeeName = sp.getString('me') ?? '';
  String lastRefresh = sp.getString('lastRefresh') ?? DateTime.now().toString();
  String refreshToken = sp.getString('refreshToken') ?? '';
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
        token: token,
        refreshToken: refreshToken,
        employeeName: employeeName,
        lastRefresh: lastRefresh,
        categories: categories,
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp(
      {Key? key,
      required this.token,
      required this.categories,
      required this.lastRefresh,
      required this.employeeName,
      required this.refreshToken})
      : super(key: key);

  final String token;
  final String refreshToken;
  final String lastRefresh;
  final String employeeName;
  final String? categories;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    final categoriesState = Provider.of<Categories>(context, listen: false);

    int tokenLen = token.length;
    int categoriesLen = categories?.length ?? 0;
    if (tokenLen > 4) {
      int freshnessOfToken =
          DateTime.now().difference(DateTime.parse(lastRefresh)).inHours;
      print('freshness ${freshnessOfToken}');
      if (freshnessOfToken >= 23) {
        print('your refresh ');
        auth.initLogin(employeeName);
        refresh(auth, context);
      } else {
        auth.initLogin(employeeName);
      }
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

refresh(Auth auth, BuildContext context) async {
  var response = await HttpClient.refreshTokenRequest();
  SharedPreferences sp = await SharedPreferences.getInstance();
  var json = jsonDecode(response.body);
  if (response.statusCode == 200) {
    print('if was called');
    print(sp.getString('refreshToken'));
    await sp.setString('accessToken', json['data']['access_token']);
    await sp.setString('refreshToken', json['data']['refresh_token']);
    await sp.setString('lastRefresh', DateTime.now().toString());
  } else {
    await sp.remove('accessToken');
    await sp.remove('refreshToken');
    auth.logout();
    auth.setShowLoginAgain(true);
  }
  print('i was called');
}
