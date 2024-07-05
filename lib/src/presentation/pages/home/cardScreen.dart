import 'package:broker/src/domain/controller/commonController.dart';
import 'package:broker/src/domain/entity/utils/image.dart';
import 'package:broker/src/domain/entity/utils/style.dart';
import 'package:broker/src/presentation/widgets/carItem.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonController>(
      builder: (commonController) {
        return ListView.builder(
          itemCount: commonController.carList.length,
          itemBuilder: (context, index) {
            return CarItem(
              index: index,
              commonController:commonController,
            );
          },
        );
      }
    );
  }
}
