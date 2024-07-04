import 'package:broker/controller/commonController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/image.dart';
import '../../../utils/style.dart';

class CarsScreen extends StatelessWidget {
  const CarsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CommonController>(
      builder: (commonController) {
        return ListView.builder(
          itemCount: commonController.carList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              child: Card(
                color: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(Images.demoCard),
                        if (index == 0) Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: Colors.white
                          ),
                          margin: EdgeInsets.only(left: 15, top: 15),
                          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 4),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset(Images.host_flat_start, height: 20,),
                              Text("Top host", style: poppinsSemiBold.copyWith(fontSize: 12, color: Colors.black),),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 15, top: 15),
                          child: InkWell(
                            onTap: (){
                              commonController.cardLike(index, !commonController.carList[index]);
                            },
                            child: Align(
                              alignment: Alignment.topRight,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 15,
                                child: commonController.carList[index] ? Image.asset(Images.selectVector, height: 15) : Image.asset(Images.Vector, height: 15),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Title card item full name", style: poppinsSemiBold.copyWith(color: Colors.black)),
                          Row(
                            children: [
                              Image.asset(Images.star_flat, height: 15),
                              Text("    5.0 | 10 Trips", style: poppinsMedium.copyWith(color: Colors.grey.shade600, fontSize: 10)),
                              Spacer(),
                              Text("\$999/", style: poppinsSemiBold.copyWith(color: Colors.black)),
                              Text("day", style: poppinsSemiBold.copyWith(color: Colors.grey.shade600)),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset(Images.location_flat, height: 15, color: Colors.black,),
                              Text("   11.6 mi from current location", style: poppinsMedium.copyWith(color: Colors.grey.shade600, fontSize: 12)),
                            ],
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        );
      }
    );
  }
}
