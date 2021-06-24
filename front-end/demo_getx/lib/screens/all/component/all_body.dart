import 'package:demo_getx/controller/movie_controller.dart';
import 'package:demo_getx/screens/all/component/movie_list.dart';
import 'package:demo_getx/widget/custom_loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBody extends GetWidget<MovieController> {
  final MovieController _controller = Get.put(MovieController(params: {"id_status": Get.parameters['idStatus']}));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Obx(() {
            if (_controller.isLoading.value) {
              return CircularIndicator();
            }
            return MovieList(movies: _controller.movies);
          }),
    );
  }
}