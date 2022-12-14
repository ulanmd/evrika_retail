import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';


const URL = 'http://10.10.1.75:71';

class HttpClient{

  static Future<String?> getToken()async{
    SharedPreferences sp =
        await SharedPreferences.getInstance();
    String? token =
        await sp.getString('accessToken');
    return token;
  }

  static Future<Response> authRequest(String qr) async {
    var response = await http.post(
        Uri.parse(
            '$URL/api/v1/login/token'),
        headers: {
          "Accept": "application/json",
          "Content-Type" : "application/json"
        },
        body: jsonEncode({
          "token": "00000001"
        }));
    print(response);
    print(response.statusCode);
    return response;
  }

  static Future<Response> meRequest(String token) async {
    var response = await http.get(
        Uri.parse(
            '$URL/api/v1/me'),
        headers: {
          "Accept": "application/json",
          "Authorization" : "Bearer $token"
        },);
    return response;
  }

  static Future<String> getCategories() async {
    var token = await getToken();
    var response = await http.get(
        Uri.parse(
            '$URL/api/v1/service/cores/category/tree'),
        headers: {
          "Accept": "application/json",
          "authorization" : "Bearer $token"
        },);
   // return jsonDecode(response.body);
    return response.body;
  }

  static Future<String> getCategoryById(String id) async {
    var token = await getToken();
    var response = await http.get(
      Uri.parse(
          '$URL/api/v1/service/cores/products?categories=$id'),
      headers: {
        "Accept": "application/json",
        "authorization" : "Bearer $token"
      },);
    // return jsonDecode(response.body);
    return response.body;
  }

  static Future<Response> getCategoryByQr(String qrCode) async {
    var token = await getToken();
    var response = await http.get(
      Uri.parse(
          '$URL/api/v1/products/$qrCode/code?include=price_new'),
      headers: {
        "Accept": "application/json",
        "authorization" : "Bearer $token"
      },);
    // return jsonDecode(response.body);
    return response;
  }

  static Future<Response> getCategoryByText(String text) async {
    var token = await getToken();
    var response = await http.get(
      Uri.parse(
          '$URL/api/v1/service/cores/products?search=$text'),
      headers: {
        "Accept": "application/json",
        "authorization" : "Bearer $token"
      },
    );
    // return jsonDecode(response.body);
    return response;
  }
}