import 'package:demo_getx/controller/find_movie_controller.dart';
import 'package:demo_getx/screens/find/component/top_movie.dart';
import 'package:demo_getx/screens/find/component/top_search.dart';
import 'package:demo_getx/widget/Search_header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config.dart';

class FindBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:GetBuilder<FindMovieController>(init: FindMovieController(), builder: (controller) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: getProportionateScreenHeight(20)),
            SearchHeader(),
            SizedBox(height: getProportionateScreenHeight(20)),
            // TopSearch()
            TopMovie(movieList: controller.movies,)
          ],
        ),
      )),
    );
  }
}