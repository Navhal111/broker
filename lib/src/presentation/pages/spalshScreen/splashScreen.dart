import 'dart:async';
import 'package:broker/src/domain/entity/utils/image.dart';
import 'package:broker/src/presentation/helper/route_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(const Duration(seconds: 1), () => Get.offNamed(RouteHelper.getBottomBarScreen()));

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Image.asset(Images.appLogo, height: 70)
        )
    );
  }

}
