import 'package:evrika_retail/config/evrika_text_styles.dart';
import 'package:evrika_retail/utils/consts.dart';
import 'package:evrika_retail/profile_bottom_modal.dart';
import 'package:evrika_retail/screens/link_screen.dart';
import 'package:evrika_retail/screens/online_orders_screen.dart';
import 'package:evrika_retail/screens/orders_screen.dart';
import 'package:evrika_retail/screens/sales_screen.dart';
import 'package:evrika_retail/state/loading.dart';
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
            borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        builder: (context) => const ProfileBottomModal());
  }

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<Auth>();
    final loading = context.watch<Loading>();
    var width = MediaQuery.of(context).size.width;
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
            _currentIndex == 0
                ? InkWell(
                    onTap: () {
                      final controller = TextEditingController();
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 30, horizontal: 10),
                          width: width * 0.95,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                color: Colors.white.withOpacity(0.9),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 20, left: 10, right: 10, bottom: 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        height: 47,
                                        child: TextFormField(
                                          autofocus: true,
                                          textInputAction:
                                              TextInputAction.search,
                                          controller: controller,
                                          onFieldSubmitted: (_) async {
                                            loading.setIsSearchOpened(true);
                                            Navigator.pop(context);
                                          },
                                          decoration: InputDecoration(
                                            hintText: 'Введите номер заявки...',
                                            suffixIcon: IconButton(
                                              onPressed: () {
                                                loading.setIsSearchOpened(true);
                                                Navigator.pop(context);
                                              },
                                              icon: SvgPicture.asset(
                                                '$kAssetIcons/search.svg',
                                                color:
                                                    EvrikaColors.kPrimaryColor,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.fromLTRB(
                                                15.0, 10.0, 20.0, 10.0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    // onDoubleTap: (){
                    //   print('double tapped');
                    //   loading.setIsSearchOpened(true);
                    // },
                    child: SvgPicture.asset(
                      '$kAssetIcons/search.svg',
                    ),
                  )
                : Container(),
            const SizedBox(
              width: 10,
            ),
            TextButton(
              onPressed: () {
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
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(new FocusNode()),
          child: IndexedStack(
            index: _currentIndex,
            children: _pages,
          ),
        ),
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
        selectedLabelStyle: EvrikaTextStyles.darkS12W600,
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
