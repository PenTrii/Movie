import 'package:demo_getx/constant/const.dart';
import 'package:demo_getx/constants.dart';
import 'package:demo_getx/models/movie.dart';
import 'package:demo_getx/screens/details/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../config.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    Key key,
    this.width = 140,
    this.aspectRetio = 1.02,
    @required this.movie,
  }) : super(key: key);

  final double width, aspectRetio;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(width),
        child: GestureDetector(
          onTap: () {
            Get.toNamed("${DetailsScreen.routeName}?idMovie=${movie.id}&title=${movie.title}");
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: aspectRetio,
                child: Container(
                  decoration: BoxDecoration(
                    color: secondaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network("${Constants.URL_IMAGE}${movie.images}", fit: BoxFit.cover,)
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                movie.title,
                style: TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Tập ${movie.episodeNumber}",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}