import 'package:broker/src/presentation/pages/bottomBar/bottomBarScreen.dart';
import 'package:broker/src/presentation/pages/spalshScreen/splashScreen.dart';
import 'package:get/get.dart';

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
