import 'package:broker/src/data/network/api_client.dart';
import 'package:broker/src/domain/controller/authController.dart';
import 'package:broker/src/domain/controller/commonController.dart';
import 'package:broker/src/domain/controller/themeController.dart';
import 'package:broker/src/domain/entity/constants/constant_apis.dart';
import 'package:broker/src/domain/repository/authRepo.dart';
import 'package:broker/src/domain/repository/common_repo.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()),fenix: true);

  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()), fenix: true); //sharedPreferences: Get.find()
  Get.lazyPut(() => AuthController(authRepo: Get.find()),fenix: true);
  Get.lazyPut(() => CommonController(commonRepo: Get.find()),fenix: true);
  Get.lazyPut(() => CommonRepo(sharedPreferences: Get.find(), apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find()), fenix: true);
}