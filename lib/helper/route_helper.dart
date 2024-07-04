
import 'package:get/get.dart';

import '../view/pages/bottomBar/bottomBarScreen.dart';
import '../view/pages/splashScreen.dart';




class RouteHelper {
  static const String splash = '/splash';
  static const String bottomBarScreen = '/bottomBarScreen';

  static String getSplashRoute() => '$splash';
  static String getBottomBarScreen() => '$bottomBarScreen';


  static List<GetPage> routes = [
    GetPage(name: splash, page: () => SplashScreen()),
    GetPage(name: bottomBarScreen, page: () => BottomBarScreen()),

  ];
}
