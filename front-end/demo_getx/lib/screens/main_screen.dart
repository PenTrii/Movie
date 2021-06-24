import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:demo_getx/constants.dart';
import 'package:demo_getx/controller/bottom_nav_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config.dart';

class MainScreen extends StatefulWidget {
  static const String routeName = "MainUI";

  @override
  MainScreenState createState() {
    return MainScreenState();
  }
}

class MainScreenState extends State<MainScreen> {
  BottomNavigationPageController controller = Get.put(BottomNavigationPageController());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Obx(() => Scaffold(
      body: BottomNavigationPageController.to.currentPage,
      bottomNavigationBar: BubbleBottomBar(
        hasNotch: true,
        hasInk: true,
        opacity: 1,
        elevation: 8,
        currentIndex: BottomNavigationPageController.to.currentIndex.value,
        onTap: BottomNavigationPageController.to.changePage,
        items: <BubbleBottomBarItem> [
          BubbleBottomBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.home_rounded,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.home_rounded,
                color: Colors.white,
              ),
              title: Text('Trang chủ', style: TextStyle(color: Colors.white),)),
          BubbleBottomBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              title: Text('Tìm kiếm', style: TextStyle(color: Colors.white),)),
          BubbleBottomBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.dashboard,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
              title: Text('Thể Loại', style: TextStyle(color: Colors.white),)),
          BubbleBottomBarItem(
              backgroundColor: primaryColor,
              icon: Icon(
                Icons.favorite,
                color: Colors.grey,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              title: Text('Yêu thích', style: TextStyle(color: Colors.white),)),
        ],
      ),
    ));
  }
}
