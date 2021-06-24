import 'package:demo_getx/widget/movie_card.dart';
import 'package:demo_getx/widget/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo_getx/models/movie.dart';
import 'package:get/get.dart';

import '../../../config.dart';

class AllMovie extends StatelessWidget {
  final String title;
  final String idCategory;
  final List<Movie> movieList;

  const AllMovie({Key key, this.title, this.movieList, this.idCategory}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: title, press: () => Get.toNamed("/all?idCategory=$idCategory&title=$title")),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Padding(
          padding: EdgeInsets.only(right: getProportionateScreenWidth(20)),
          child: GridView.count(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap : true,
            crossAxisCount: 2,
            children: List.generate(
              movieList.length,
                  (index) => MovieCard(movie: movieList[index], aspectRetio: 1.275),
            ),
          ),
        )
      ],
    );
  }
}
