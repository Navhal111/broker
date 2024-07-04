import 'dart:ui';

import 'package:get/get.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../constants/constant_apis.dart';
import '../utils/string.dart';


class ThemeController extends GetxController implements GetxService {
  final SharedPreferences sharedPreferences;

  ThemeController({required this.sharedPreferences}) {
    _loadCurrentTheme();
  }

  bool _darkTheme = false;
  bool get darkTheme => _darkTheme;

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    sharedPreferences.setBool(Strings.THEME, _darkTheme);
    update();
  }

  void _loadCurrentTheme() async {
    _darkTheme = sharedPreferences.getBool(Strings.THEME) ?? false;
    update();
  }


  String _language = "US";
  String get language => _language;


  int isLanguage = 0;
  changeInitLanguage(){
    if(language == "US"){
      Get.updateLocale(const Locale('en', 'US'));
      isLanguage = 0;
    }else{
      Get.updateLocale(const Locale('ko', 'KR'));
      isLanguage = 1;
    }
  }

}