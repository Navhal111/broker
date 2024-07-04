import 'package:get/get_connect/http/src/response/response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/api_client.dart';


class CommonRepo{
  late SharedPreferences sharedPreferences;
  final ApiClient apiClient;

  CommonRepo({required this.apiClient, required this.sharedPreferences});



  Future<Response> postDataSet({required Map<String, dynamic> sendData, required String apiName}) async {
    return await apiClient.postData(apiName, sendData);
  }

  Future<Response> getDates({required String apiName}) async {
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