import 'package:evrika_retail/screens/login_screen.dart';
import 'package:evrika_retail/screens/main_screen.dart';
import 'package:evrika_retail/screens/online_orders_screen.dart';
import 'package:evrika_retail/state/auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/evrika_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences sp = await SharedPreferences.getInstance();
  var userData = sp.getStringList('userData');
  runApp(MultiProvider(
      providers: [
        Provider<Auth>(
          create: (_) => Auth(),
        )
      ],
      child: MyApp(
        userData: userData,
      )));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.userData}) : super(key: key);

  final List<String>? userData;

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<Auth>(context, listen: false);
    //print(sp.getString('accessToken').toString());
    print('from main ${userData}');
    print('from main ${userData.runtimeType}');
    print('isAuth: ' + auth.isAuth.toString());

    int length = userData?[0].length ?? 0;
    if (length > 4) {
      auth.initLogin(userData![2], userData![1]);
    }
    return MaterialApp(
      title: 'Evrika Retail',
      theme: evrikaTheme,
      home: auth.isAuth ? MainScreen() : LoginScreen(),
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
