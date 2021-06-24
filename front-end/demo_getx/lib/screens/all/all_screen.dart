import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../config.dart';
import 'component/all_body.dart';

class AllScreen extends StatelessWidget {

  static String routeName = "/all";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: AllBody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        "${Get.parameters['title']}",
        style: TextStyle(color: Colors.black),
      ),
      leading: SizedBox(
        height: getProportionateScreenWidth(40),
        width: getProportionateScreenWidth(40),
        child: FlatButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(60),
          ),
          color: Colors.white,
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          child: SvgPicture.asset(
            "assets/icons/Back ICon.svg",
            height: 15,
          ),
        ),
      ),
    );
  }
}