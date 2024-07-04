import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/image.dart';
import '../../../utils/style.dart';
import 'homeScreen.dart';

class BottomBarScreen extends StatefulWidget {
  const BottomBarScreen({super.key});

  @override
  State<BottomBarScreen> createState() => _BottomBarScreenState();
}

class _BottomBarScreenState extends State<BottomBarScreen> with SingleTickerProviderStateMixin {

  int _selectedIndex = 0;
  static List<Widget> _bodyView = <Widget>[
    HomeScreen(),
    Text('Coming Soon', style: poppinsSemiBold.copyWith(fontSize: 20)),
    Text('Coming Soon', style: poppinsSemiBold.copyWith(fontSize: 20)),
    Text('Coming Soon', style: poppinsSemiBold.copyWith(fontSize: 20)),
    Text('Coming Soon', style: poppinsSemiBold.copyWith(fontSize: 20)),
  ];



  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }



  @override
  Widget build(BuildContext context) {

    List<String> _icons = [
      Images.buttom_search,
      Images.buttom_trips,
      Images.buttom_profile,
      Images.buttom_inbox,
      Images.buttom_favorities,
    ];

    List<String> _name = [
      "Explore", "Favorite", "Trips", "Inbox", "Profile"
    ];

    return Scaffold(
      body: Center(
        child: _bodyView.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        height: 80,
        width: Get.width,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.grey.shade300, spreadRadius: -1, blurRadius: 5),
            ],
            color: Colors.white
        ),
        child: TabBar(
            onTap: (x) {
              setState(() {
                _selectedIndex = x;
              });
            },
            labelColor: Colors.white,
            unselectedLabelColor: Colors.blueGrey,
            indicator: const UnderlineTabIndicator(
              borderSide: BorderSide.none,
            ),
            tabs: [
              for (int i = 0; i < _icons.length; i++)
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(_icons[i], height: 25,width: 25,fit: BoxFit.contain, color: i == _selectedIndex ? Theme.of(context).primaryColor : Colors.grey,),
                    SizedBox(height: 6),
                    Text(_name[i], style: poppinsMedium.copyWith(color: i == _selectedIndex ? Theme.of(context).primaryColor : Colors.grey, fontSize: 12),)
                  ],
                ),
            ],
            controller: _tabController
        ),
      ),
    );
  }

}
