import 'package:http/http.dart' as http;
import 'package:http/http.dart';


const URL = 'https://99eb-89-218-145-198.in.ngrok.io';

class HttpClient{

  static Future<Response> authRequest(String qr) async {
    var response = await http.post(
        Uri.parse(
            '$URL/api/v1/login/token'),
        headers: {
          "Accept": "application/json",
        },
        body: {
          "token": "${qr}"
        });
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

  static Future<Response> getCategories(String token) async {
    var response = await http.get(
        Uri.parse(
            '$URL/api/v1/service/cores/category/tree'),
        headers: {
          "Accept": "application/json",
          "authorization" : "Bearer $token"
        },);
    return response;
  }
}