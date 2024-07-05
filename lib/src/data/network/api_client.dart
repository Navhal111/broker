import 'package:broker/src/domain/entity/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Response;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';


class ApiClient extends GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;
  static const String noInternetMessage =
      'Connection to API server failed due to internet connection';
  final int timeoutInSeconds = 30;
  final dio = Dio();
  String? token;
  String? reToken;
  Map<String, String>? _mainHeaders;

  ApiClient({required this.appBaseUrl, required this.sharedPreferences}) {
    token = sharedPreferences.getString(Strings.TOKEN);

    if (token != null && reToken != null) {
      updateHeader(
        token,
        sharedPreferences.getString(Strings.LANGUAGE_CODE),
      );
    } else {
      updateHeader(
        "",
        sharedPreferences.getString(Strings.LANGUAGE_CODE),
      );
    }
  }

  void updateHeader(String? token, String? languageCode) {
    _mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      "Authorization": 'Bearer ' + token!,
    };
  }

  Future<Response?> getData(String uri,
      {Map<String, dynamic>? query, Map<String, String>? headers}) async {
    try {
      if (token != null) {
        updateHeader(
          token,
          sharedPreferences.getString(Strings.LANGUAGE_CODE),
        );
      }

      Response<Map<String, dynamic>> _response = await dio.get(
        appBaseUrl + uri
      );
      return _response;
    } catch (e) {
      debugPrint("$e");
    }
  }

}
