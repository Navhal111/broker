import 'package:broker/src/data/network/api_client.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CommonRepo{
  late SharedPreferences sharedPreferences;
  final ApiClient apiClient;

  CommonRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response?> getDates({required String apiName}) async {
    return await apiClient.getData(apiName);
  }


  String getUserData(String Keys) {
    return sharedPreferences.getString(Keys) ?? "";
  }

  Future<bool> setUserData(String Keys, String UserData){
    return sharedPreferences.setString(Keys, "$UserData");
  }

  Future<bool> removeUser() async {
    return await sharedPreferences.clear();
  }

}