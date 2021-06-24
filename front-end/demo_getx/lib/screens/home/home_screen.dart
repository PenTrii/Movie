import 'package:demo_getx/screens/home/component/home_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
    );
  }
}