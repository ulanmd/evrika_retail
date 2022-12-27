import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

const URL = 'http://10.10.1.75:71';

class HttpClient {
  static Future<String?> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = await sp.getString('accessToken');
    return token;
  }

  static Future<String> getRefreshToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String token = await sp.getString('refreshToken') ?? 'nothing';
    return token;
  }

  static Future authRequest(String qr) async {
    var response = await http.post(
      Uri.parse('$URL/api/v1/login/token?token=$qr'),
      headers: {
        "Accept": "application/json",
      },
      body: {},
    ).timeout(Duration(seconds: 60), onTimeout: () {
      print('shili uzaq bolyp ketti');
      return http.Response('Сервер не отвечает', 408);
    }).onError(
      (error, stackTrace) => http.Response('Ошибка', 500),
    );
    return response;
  }

  static Future meRequest(String token) async {
    var response = await http.get(
      Uri.parse('$URL/api/v1/me'),
      headers: {"Accept": "application/json", "Authorization": "Bearer $token"},
    ).timeout(Duration(seconds: 60), onTimeout: () {
      print('shili uzaq bolyp ketti');
      return http.Response('Сервер не отвечает', 408);
    }).onError(
          (error, stackTrace) => http.Response('Ошибка', 500),
    );
    return response;
  }

  static Future refreshTokenRequest() async {
    var refreshToken = await getRefreshToken();

    var response = await http.post(
      Uri.parse('$URL/api/v1/refresh/$refreshToken'),
      headers: {"Accept": "application/json"},
    ).timeout(Duration(seconds: 60), onTimeout: () {
      print('shili uzaq bolyp ketti');
      return http.Response('Сервер не отвечает', 408);
    }).onError(
          (error, stackTrace) => http.Response('Ошибка', 500),
    );
    return response;
  }

  static Future<String> getCategories() async {
    var token = await getToken();
    var response = await http.get(
      Uri.parse('$URL/api/v1/service/cores/category/tree'),
      headers: {"Accept": "application/json", "authorization": "Bearer $token"},
    );
    return response.body;
  }

  static Future<String> getCategoryById(String id) async {
    var token = await getToken();
    var response = await http.get(
      Uri.parse('$URL/api/v1/service/cores/products?categories=$id'),
      headers: {"Accept": "application/json", "authorization": "Bearer $token"},
    );
    return response.body;
  }

  static Future getCategoryByQr(String qrCode) async {
    var token = await getToken();
    var response = await http.get(
      Uri.parse('$URL/api/v1/products/$qrCode/code?include=price_new'),
      headers: {"Accept": "application/json", "authorization": "Bearer $token"},
    );
    // return jsonDecode(response.body);
    return response;
  }

  static Future getCategoryByText(String text) async {
    var token = await getToken();
    var response = await http.get(
      Uri.parse('$URL/api/v1/service/cores/products?search=$text'),
      headers: {"Accept": "application/json", "authorization": "Bearer $token"},
    );

    return response;
  }

  static Future getCustomerByPhoneNumber(String number) async {
    var token = await getToken();
    var response = await http.get(
      Uri.parse('$URL/api/v1/service/loyalty/customer/$number'),
      headers: {"Accept": "application/json", "authorization": "Bearer $token"},
    );

    return response;
  }

  static Future registerCustomer(Map customerObject) async {
    var token = await getToken();
    var response = await http.post(
      Uri.parse('$URL/api/v1/service/loyalty/customer'),
      headers: {
        "Accept": "application/json",
        "Content-Type" : "application/json",
        "authorization": "Bearer $token"
      },
      body: jsonEncode(customerObject)
    ).timeout(Duration(seconds: 60), onTimeout: () {
      print('shili uzaq bolyp ketti');
      return http.Response('Сервер не отвечает', 408);
    }).onError(
          (error, stackTrace) => http.Response('Ошибка', 500),
    );
    return response;
  }
}
