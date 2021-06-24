import 'package:demo_getx/screens/details/component/detail_body.dart';
import 'package:demo_getx/widget/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsScreen extends StatelessWidget {
  static String routeName = "/detail";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(rating: 4, title: Get.parameters['title'],),
      body: DetailBody(),
    );
  }
}
