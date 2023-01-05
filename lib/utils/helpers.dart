import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../state/auth.dart';
import 'http_requests.dart';

refresh(Auth auth, BuildContext context) async {
  var response = await HttpRequests.refreshTokenRequest();
  SharedPreferences sp = await SharedPreferences.getInstance();
  var json = jsonDecode(response.body);
  if (response.statusCode == 200) {
    print('refresh token was called');
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