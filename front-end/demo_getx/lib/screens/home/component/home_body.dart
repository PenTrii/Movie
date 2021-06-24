import 'package:demo_getx/controller/bottom_nav_page_controller.dart';
import 'package:demo_getx/controller/metadata_controller.dart';
import 'package:demo_getx/widget/Search_header.dart';
import 'package:demo_getx/screens/home/component/new_movie.dart';
import 'package:demo_getx/screens/home/component/special_movie.dart';
import 'package:demo_getx/widget/custom_loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config.dart';
import '../../../constants.dart';

class HomeBody extends StatelessWidget {
  final MetadataController _controller = Get.put(MetadataController(), tag: "HomeBody");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:  Obx (() {
          if (_controller.isLoading.value) {
            return CircularIndicator();
          }
          return SmartRefresher(
            enablePullDown: true,
            header: MaterialClassicHeader(
              color: primaryColor,
            ),
            controller: _controller.refreshController,
            onRefresh: () => _controller.fetchFinalMetadata(),
            onLoading: () {},
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: getProportionateScreenHeight(20)),
                  SearchHeader(onPress: () => BottomNavigationPageController.to.changePage(1),),
                  NewMovie(),
                  SizedBox(height: getProportionateScreenWidth(20)),
                  ...List.generate(_controller.metadata.value.result.length, (index) {
                    return Column(
                      children: [
                        SpecialMovie(
                          title: _controller.metadata.value.result[index].title,
                          idStatus: _controller.metadata.value.result[index].idStatus,
                          movieList: _controller.metadata.value.result[index].movieList,
                        ),
                        SizedBox(height: getProportionateScreenWidth(20)),
                      ],
                    );
                  }),
                ],
              ),
            ),
          );
        })
    );
  }
}
