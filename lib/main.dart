import 'package:broker/src/domain/controller/themeController.dart';
import 'package:broker/src/domain/entity/utils/string.dart';
import 'package:broker/src/presentation/helper/route_helper.dart';
import 'package:broker/src/presentation/theme/dark.dart';
import 'package:broker/src/presentation/theme/light.dart';
import 'package:broker/translations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:broker/src/presentation/helper/get_di.dart' as di;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
        builder: (themeController) {
          return GetMaterialApp(
            builder: (context, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(boldText: false),
              child: child!,
            ),
            title: Strings.APP_NAME,
            theme: themeController.darkTheme ? dark : light,
            debugShowCheckedModeBanner: false,
            scrollBehavior: const MaterialScrollBehavior(),
            initialRoute: RouteHelper.getSplashRoute(),
            getPages: RouteHelper.routes,
            defaultTransition: Transition.rightToLeft,
            transitionDuration: const Duration(milliseconds: 500),
            onInit: themeController.changeInitLanguage,
            translations: MyTranslations(),
            locale: Locale('en', 'US'),
            fallbackLocale: Locale('en', 'US'),
          );
        }
    );
  }
}
