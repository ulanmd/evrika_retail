import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../evrika_colors.dart';

class YMapScreen extends StatefulWidget {
  const YMapScreen({Key? key}) : super(key: key);

  @override
  State<YMapScreen> createState() => _YMapScreenState();
}

class _YMapScreenState extends State<YMapScreen> {
final _key = UniqueKey();
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: EvrikaColors.kPrimaryColor,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Выбрать адрес',
          style: TextStyle(color: EvrikaColors.kPrimaryColor),
        ),
      ),
      body: Stack(
        children: <Widget>[
          WebView(
            key: _key,
            initialUrl: 'https://udrepo.github.io/yandex_point/',
            javascriptMode: JavascriptMode.unrestricted,
            onPageFinished: (finish) {
            },
          ),
          false
              ? Center(
            child: CircularProgressIndicator(),
          )
              : Stack(),
        ],
      ),
      floatingActionButton: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        style: ElevatedButton.styleFrom(
            primary: EvrikaColors.kPrimaryColor, padding: EdgeInsets.all(5)),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          width: 170,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Выбрать',
                style: TextStyle(color: EvrikaColors.white, fontSize: 14),
              ),
              SizedBox(width: 10,),
              Icon(
                Icons.location_on,
                color: EvrikaColors.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
