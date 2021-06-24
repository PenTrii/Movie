import 'package:demo_getx/constant/const.dart';
import 'package:demo_getx/controller/movie_controller.dart';
import 'package:demo_getx/models/movie.dart';
import 'package:demo_getx/screens/details/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../config.dart';
import '../../../constants.dart';

class MovieList extends StatelessWidget {
  final String title;
  final List<Movie> movies;
  final MovieController _controller = Get.find();

  MovieList({Key key, this.title, this.movies}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MovieController>(
      builder: (_) {
        return SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: MaterialClassicHeader(
            color: primaryColor,
          ),
          footer: CustomFooter(
          builder: (BuildContext context,LoadStatus mode){
              Widget body ;
              if(mode==LoadStatus.loading){
                body =  CupertinoActivityIndicator();
              }
              return Container(
                  height: 55.0,
                  child: Center(child:body),);
            }
          ),
          controller: _controller.refreshController,
          onRefresh: () => _controller.fetchFinalMovie(),
          onLoading: () => _controller.fetchLoadMoreMovie(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: getProportionateScreenWidth(10)),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.95 / 3,
                    ),
                    shrinkWrap: true,
                    itemCount: movies.length,
                    itemBuilder: (BuildContext context, int index) => MovieItem(movie: movies[index]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MovieItem extends StatelessWidget {

  const MovieItem({
    Key key,
    @required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(10)),
      child: GestureDetector(
        onTap: () {
          Get.toNamed("${DetailsScreen.routeName}?idMovie=${movie.id}&title=${movie.title}");
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 0.85,
              child: Container(
                decoration: BoxDecoration(
                  color: secondaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(0),
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
            Text(
              "Tập ${movie.episodeNumber}",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

