import 'package:carousel_slider/carousel_slider.dart';
import 'package:demo_getx/constant/const.dart';
import 'package:demo_getx/controller/metadata_controller.dart';
import 'package:demo_getx/screens/details/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config.dart';

class NewMovie extends StatelessWidget {

  final MetadataController controller = Get.find(tag: "HomeBody");

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          SizedBox(height: getProportionateScreenWidth(20)),
          Padding(
            padding: EdgeInsets.only(right: getProportionateScreenWidth(0)),
            child: Stack(
              children: [
                CarouselSlider(
                  options: CarouselOptions(
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    height: SizeConfig.screenHeight * 0.2,
                    viewportFraction: 0.9,
                    onPageChanged: (index, reason) => controller.onChangeIndexSlider(index),
                  ),
                  items: controller.metadata.value.banner.movieList.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return NewMovieCard(
                            movieName: movie.title,
                            image: movie.banner,
                            episodeNumber: movie.episodeNumber,
                            press: () => Get.toNamed("${DetailsScreen.routeName}?idMovie=${movie.id}&title=${movie.title}"));
                      },
                    );
                  }).toList(),
                ),
                Positioned(
                  top: 0,
                  right: getProportionateScreenWidth(30.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: controller.metadata.value.banner.movieList.map((url) {
                      int index = controller.metadata.value.banner.movieList.indexOf(url);
                      return Container(
                        width: 8.0,
                        height: 8.0,
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: controller.currentIndexSlider.value == index
                              ? Colors.white
                              : Colors.white54,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }
}

class NewMovieCard extends StatelessWidget {
  const NewMovieCard({
    Key key,
    @required this.movieName,
    @required this.image,
    @required this.episodeNumber,
    @required this.press,
  }) : super(key: key);

  final String movieName, image;
  final int episodeNumber;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: SizeConfig.screenWidth * 0.9,
        height: getProportionateScreenWidth(100),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Positioned(
                top: 10,
                right: 0,
                child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5))),
              ),
              Image.network(
                "${Constants.URL_IMAGE}$image",
                width: SizeConfig.screenWidth * 0.9,
                height: SizeConfig.screenHeight,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 0,
                right: getProportionateScreenWidth(25.0),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getProportionateScreenWidth(15.0),
                    right: getProportionateScreenWidth(25.0),
                    top: getProportionateScreenWidth(10),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$movieName",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: getProportionateScreenWidth(18),
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        "$episodeNumber tập",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
