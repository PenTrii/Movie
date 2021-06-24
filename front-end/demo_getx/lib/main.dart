import 'package:demo_getx/routes.dart';
import 'package:demo_getx/screens/home/home_screen.dart';
import 'package:demo_getx/screens/main_screen.dart';
import 'package:demo_getx/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme(),
      initialRoute: MainScreen.routeName,
      getPages: routes,
    );
  }
}

