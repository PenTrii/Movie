import 'package:demo_getx/models/movie.dart';
import 'package:demo_getx/widget/movie_card.dart';
import 'package:flutter/material.dart';

import '../../../config.dart';

class TopMovie extends StatelessWidget {
  final List<Movie> movieList;

  const TopMovie({Key key, this.movieList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(25)),
          child: Text("Danh sách đề suất",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(12),
              color: Colors.black,
            ),),
        ),
        SizedBox(height: getProportionateScreenHeight(10)),
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