import 'package:demo_getx/screens/find/component/find_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindScreen extends StatelessWidget {

  static String routeName = "/find";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FindBody(),
    );
  }
}