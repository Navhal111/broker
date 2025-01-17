import 'package:broker/src/domain/controller/commonController.dart';
import 'package:broker/src/domain/entity/utils/image.dart';
import 'package:broker/src/domain/entity/utils/style.dart';
import 'package:broker/src/presentation/widgets/filterOption.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'cardScreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CommonController>(
        builder: (commonController) {
          return SafeArea(
            child: Column(
              children: [
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(color: Colors.grey.shade300, spreadRadius: -1, blurRadius: 10),
                      ],
                      color: Colors.white
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 5),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  child: IntrinsicHeight(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: (){
                            showModalBottomSheet<void>(
                                context: context,
                                useSafeArea: true,
                              isScrollControlled: true,
                                builder: (BuildContext context) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
                                  child: SizedBox(
                                      height: Get.height*0.9,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          AppBar(
                                            leading: IconButton(onPressed: () =>Get.back(), icon: Icon(Icons.close)),
                                            title: Text("Where".tr, style: poppinsSemiBold.copyWith(fontSize: 16)),
                                            centerTitle: true,
                                          ),
                                          Divider(color: Colors.grey.shade300),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                            child: TextField(
                                              decoration: InputDecoration(
                                                isDense: true,
                                                hintText: "citySerach".tr,
                                                hintStyle: TextStyle(fontSize: 14),
                                                prefixIcon: Padding(
                                                  padding: const EdgeInsets.all(12.0),
                                                  child: Image.asset(Images.location_flat, height: 10),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1),
                                                ),
                                                enabledBorder: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(10),
                                                  borderSide: BorderSide(color: Theme.of(context).secondaryHeaderColor, width: 1),
                                                ),
                                                border: InputBorder.none,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height:  Get.height*0.02),
                                          Expanded(
                                            child: Column(
                                              children: [
                                                FilterOptions(
                                                  title: "currentLocation".tr,
                                                  image: Images.location_flat,
                                                ),
                                                Divider(color: Colors.grey.shade300),

                                                FilterOptions(
                                                  title: "losAngeles".tr,
                                                  image: Images.location_flat,
                                                ),
                                                Divider(color: Colors.grey.shade300),

                                                FilterOptions(
                                                  title: "sanFrancisco".tr,
                                                  image: Images.location_flat,
                                                ),
                                                Divider(color: Colors.grey.shade300),
                                              ],
                                            ),
                                          )
                                  
                                        ],
                                      ),
                                    ),
                                );
                                },
                            );

                          },
                          child: Row(
                            children: [
                              Image.asset(Images.location_flat, height: 25, color: Theme.of(context).secondaryHeaderColor,),
                              Text("  Miami Beach, FL", style: poppinsMedium.copyWith(color: Theme.of(context).secondaryHeaderColor)),
                            ],
                          ),
                        ),
                        Spacer(),
                        VerticalDivider(color: Colors.grey.shade400,),
                        Image.asset(Images.date_time_flat, height: 25, color: Theme.of(context).secondaryHeaderColor,),
                        Text("    22/11 - 25/11", style: poppinsMedium.copyWith(color: Theme.of(context).secondaryHeaderColor)),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: DefaultTabController(
                    initialIndex: 1,
                    length: 3,
                    child: Scaffold(
                      appBar: AppBar(
                        toolbarHeight: 0.0,
                        bottom: TabBar(
                          dividerColor: Colors.grey.shade200,
                          indicatorSize: TabBarIndicatorSize.tab,
                          onTap: commonController.indexChange,
                          labelStyle: poppinsMedium.copyWith(fontSize: 12),
                          // labelColor: Theme.of(context).primaryColor,
                          unselectedLabelColor: Colors.grey,
                          tabs: <Widget>[
                            Tab(
                              text: 'Boats'.tr,
                              icon: Image.asset(Images.boat_flat, height: 25, color: commonController.indexTap == 0 ? Theme.of(context).primaryColor : Theme.of(context).secondaryHeaderColor),
                            ),
                            Tab(
                              text: 'Cars'.tr,
                              icon: Image.asset(Images.car_flat, height: 25, color: commonController.indexTap == 1 ? Theme.of(context).primaryColor : Theme.of(context).secondaryHeaderColor),
                            ),
                            Tab(
                              text: 'Stays'.tr,
                              icon: Image.asset(Images.house_flat, height: 25, color: commonController.indexTap == 2 ? Theme.of(context).primaryColor : Theme.of(context).secondaryHeaderColor),
                            ),
                          ],
                        ),
                      ),
                      body: TabBarView(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Image.asset(Images.empty_result),
                                ),
                                Text("tryChangeLocation".tr, textAlign: TextAlign.center),
                                SizedBox(height: Get.height*0.1),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Theme.of(context).primaryColor
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                                  child: Text("clearAllFilters".tr, style: TextStyle(fontSize: 12, color: Colors.white),),
                                )
                              ],
                            ),
                          ),
                          CarsScreen(),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(30.0),
                                  child: Image.asset(Images.empty_result),
                                ),
                                Text("tryChangeLocation".tr, textAlign: TextAlign.center),
                                SizedBox(height: Get.height*0.1),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(6),
                                      color: Theme.of(context).primaryColor
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                                  child: Text("clearAllFilters".tr, style: TextStyle(fontSize: 12, color: Colors.white),),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )

              ],
            ),
          );
        }
      ),
    );
  }
}

