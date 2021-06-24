import 'package:demo_getx/screens/find/find_screen.dart';
import 'package:demo_getx/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavigationPageController extends GetxController {
  static BottomNavigationPageController get to => Get.find();

  final currentIndex = 0.obs;

  List<Widget> pages = [
    HomeScreen(),
    FindScreen(),
    Center(
      child: Text('Thể loại'),
    ),
    Center(
      child: Text('Yêu thích'),
    ),
  ];

  Widget get currentPage => pages[currentIndex.value];

  void changePage(int _index) {
    currentIndex.value = _index;
  }
}