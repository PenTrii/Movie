import 'package:demo_getx/widget/movie_card.dart';
import 'package:demo_getx/widget/section_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo_getx/models/movie.dart';
import 'package:get/get.dart';

import '../../../config.dart';

class SpecialMovie extends StatelessWidget {
  final String title;
  final int idStatus;
  final List<Movie> movieList;

  const SpecialMovie({Key key, this.title, this.movieList, this.idStatus}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: title, press: () => Get.toNamed("/all?idStatus=$idStatus&title=$title")),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                movieList.length,
                    (index) => MovieCard(movie: movieList[index]),
              ),
              SizedBox(width: getProportionateScreenWidth(20)),
            ],
          ),
        )
      ],
    );
  }
}
