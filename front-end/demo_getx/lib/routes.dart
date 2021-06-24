import 'package:demo_getx/screens/all/all_screen.dart';
import 'package:demo_getx/screens/details/detail_screen.dart';
import 'package:demo_getx/screens/find/find_screen.dart';
import 'package:demo_getx/screens/home/home_screen.dart';
import 'package:demo_getx/screens/main_screen.dart';
import 'package:get/get.dart';

final List<GetPage> routes = [
  GetPage(name: MainScreen.routeName, page: () => MainScreen()),
  GetPage(name: HomeScreen.routeName, page: () => HomeScreen()),
  GetPage(name: FindScreen.routeName, page: () => FindScreen()),
  GetPage(name: DetailsScreen.routeName, page: () => DetailsScreen()),
  GetPage(name: AllScreen.routeName, page: () => AllScreen()),
];