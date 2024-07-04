
import 'dart:async';

import 'package:broker/utils/image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../helper/route_helper.dart';


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
    Timer(
      Duration(seconds: 1),
          () {
        Get.offNamed(RouteHelper.getBottomBarScreen());
      },
    );
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
