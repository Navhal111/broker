import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/api_client.dart';
import '../constants/constant_apis.dart';
import '../controller/authController.dart';
import '../controller/commonController.dart';
import '../controller/themeController.dart';
import '../repo/authRepo.dart';
import '../repo/common_repo.dart';


init() async {
  // Core
  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()),fenix: true);


  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()), fenix: true); //sharedPreferences: Get.find()
  Get.lazyPut(() => AuthController(authRepo: Get.find()),fenix: true);
  Get.lazyPut(() => CommonController(commonRepo: Get.find()),fenix: true);



  Get.lazyPut(() => CommonRepo(sharedPreferences: Get.find(), apiClient: Get.find()), fenix: true);
  Get.lazyPut(() => AuthRepo(sharedPreferences: Get.find(), apiClient: Get.find()), fenix: true);

}