import 'package:get/get.dart';

class MyTranslations extends Translations {

  static Map<String, String> en = {
    "intro1Title": "Next is a same-day delivery service",


  };


  static Map<String, String> hi = {};


  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': en,
    'hi_IN': hi,
  };


}
