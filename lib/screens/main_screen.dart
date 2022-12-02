import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/consts.dart';
import 'package:evrika_retail/profile_bottom_modal.dart';
import 'package:evrika_retail/screens/link_screen.dart';
import 'package:evrika_retail/screens/online_orders_screen.dart';
import 'package:evrika_retail/screens/orders_screen.dart';
import 'package:evrika_retail/screens/sales_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../config/evrika_colors.dart';
import '../state/auth.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // ignore: prefer_final_fields
  List<Widget> _pages = <Widget>[
    OrdersScreen(),
    SalesScreen(),
    OnlineOrderScreen(),
    LinkScreen()
  ];

  void _showBottomProfile() {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
        builder: (context) => const ProfileBottomModal());
  }

  //TODO delete
  // void checkPrefs()async{
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   print('token goi: ' + sp.getString('accessToken').toString());
  //   print('aty goi: ' + sp.getStringList('me')![0]);
  // }

  @override
  void initState() {
    // TODO: implement initState
    // Obtain shared preferences.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();
    print('name init: ${auth.nameInit}');
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            SvgPicture.asset('$kAssetIcons/evrika.svg'),
            const Spacer(),
            SvgPicture.asset('$kAssetIcons/search.svg'),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
                //   checkPrefs();
                _showBottomProfile();
              },
              child: CircleAvatar(
                radius: 20,
                backgroundColor: EvrikaColors.lightBlue,
                child: Observer(builder: (_) {
                  return Text(
                    auth.nameInit,
                    style: EvrikaTextStyles.darkS15W500,
                  );
                }),
              ),
            )
          ],
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        unselectedLabelStyle: EvrikaTextStyles.lightGrayS12W400,
        selectedLabelStyle: EvrikaTextStyles.darkS12W500,
        selectedItemColor: EvrikaColors.darkColor,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            label: 'Заявки',
            activeIcon: SvgPicture.asset(
              '$kAssetIcons/main.svg',
              color: EvrikaColors.darkColor,
            ),
            icon: SvgPicture.asset('$kAssetIcons/main.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Наработки',
            activeIcon: SvgPicture.asset(
              '$kAssetIcons/sales_active.svg',
            ),
            icon: SvgPicture.asset('$kAssetIcons/sales.svg'),
          ),
          BottomNavigationBarItem(
            label: 'Онлайн',
            activeIcon: SvgPicture.asset(
              '$kAssetIcons/ic_shop.svg',
              color: EvrikaColors.darkColor,
            ),
            icon: SvgPicture.asset(
              '$kAssetIcons/ic_shop.svg',
              color: EvrikaColors.kLightGray,
            ),
          ),
          BottomNavigationBarItem(
            label: 'Ccылка',
            activeIcon: SvgPicture.asset(
              '$kAssetIcons/link.svg',
              width: 16,
            ),
            icon: SvgPicture.asset(
              '$kAssetIcons/link.svg',
              width: 16,
              color: EvrikaColors.kLightGray,
            ),
          ),
        ],
      ),
    );
  }
}
