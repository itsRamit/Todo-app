import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/const/ApiConstant.dart';
import 'package:todo_app/model/ApiResponse.dart';

final http.Client _client = http.Client();

class ApiService {
  late ApiResponse _response;
  String token = SharedPreferenceString.accessToken;
  Future<ApiResponse> get(String path, {dynamic queryParams}) async {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer $token"
    };
    try {
      Uri uri = Uri.https(ApiConstant.baseURL, "/$path", queryParams);
      final response = await _client.get(
        uri,
        headers: headers,
      );
      log(response.statusCode.toString());

      if (response.statusCode >= 200 && response.statusCode < 299) {
        return ApiResponse.fromJson(json.decode(response.body.toString()));
      } else {
        if (response.statusCode == 403) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.remove('token');
          // AppNavigation.router.go('/launch/false');
        }
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<Response> post(String path, dynamic body) async {
    late Response response;
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      "Authorization": "Bearer $token"
    };
    try {
      Uri uri = Uri.https(ApiConstant.baseURL, "/$path");
      response = await _client.post(
        uri,
        headers: headers,
        body: json.encode(body),
      );
      if (response.statusCode == 403) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        // AppNavigation.router.go('/launch/false');
      }
      log(response.body);
    } catch (error) {
      log("error2 : $error");
    }
    return response;
  }
}
