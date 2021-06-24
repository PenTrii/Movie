import 'package:chewie/chewie.dart';
import 'package:demo_getx/constant/const.dart';
import 'package:demo_getx/models/movie.dart';
import 'package:demo_getx/service/movie_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:video_player/video_player.dart';

class MovieController extends GetxController {
  var isLoading = true.obs;
  var movies = RxList<Movie>();
  var movie = Rx<Movie>();
  Map<String, String> params;
  RefreshController refreshController = RefreshController();
  int page = 1;
  bool isMoreData = false;
  static const int limit = 3;

  MovieController({this.params});

  @override
  void onInit() {
    fetchFinalMovie();
    super.onInit();
  }

  void fetchFinalMovie() async {
    isLoading(true);
    try {
      page = 1;
      params['page'] = '$page';
      var data = await MovieService.getMoviesByIdCategory(params);
      if (data != null) {
        isMoreData = data.length >= limit;
        movies.call(data);
      }
    } finally {
      refreshController.refreshCompleted();
      isLoading(false);
    }
  }

  void fetchLoadMoreMovie() async {
    try {
      if (isMoreData) {
        params['page'] = '${++page}';
        var data = await MovieService.getMoviesByIdCategory(params);
        movies.addAll(data);

        isMoreData = data.length >= limit;
        update();
      }
    } finally {
      refreshController.loadComplete();
    }
  }
}

class MovieDetailController extends GetxController {
  var isLoading = true.obs;
  var number = Rx<int>();
  var urlVideo = Rx<String>();
  var movie = Rx<Movie>();
  Map<String, String> params;
  Map<String, String> body;

  ChewieController chewieController;
  VideoPlayerController videoPlayerController;

  MovieDetailController({this.params});

  @override
  void onInit() {
    fetchFinalMovieDetail();
    super.onInit();
  }

  @override
  void onClose() {
    videoPlayerController?.dispose();
    chewieController?.dispose();
    super.onClose();
  }

  void fetchFinalMovieDetail() async {
    isLoading(true);
    try {
      var data = await MovieService.getMovieDetail(params);
      if (data != null) {
        movie.value = data;
      }
      number.value = movie.value.video[0].number;
      urlVideo.value = movie.value.video[0].url;
      await loadVideo(urlVideo.value);
    } finally {
      isLoading(false);
    }
  }

  void onPressEpisode(int episode, String url) async {
    isLoading(true);
    try {
      number.value = episode;
      urlVideo.value = url;
      await loadVideo(urlVideo.value);
    } finally {
      update();
      isLoading(false);
    }
  }

  void onPressFavorite() async {
    try {
      await MovieService.putMovieFavorite(body);
      movie.value.isFavorite ? movie.value.isFavorite = false : movie.value.isFavorite = true;
    } finally {
      update();
    }
  }

  Future loadVideo(String url) async {
    videoPlayerController?.pause();
    chewieController?.pause();
    videoPlayerController = VideoPlayerController.network("${Constants.URL_VIDEO}$url");
    await videoPlayerController.initialize();

    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        autoPlay: false,
        looping: false,
        aspectRatio: 16 / 9,
        autoInitialize: true,
        errorBuilder: (context, errorMessage) {
          return Text(
            errorMessage,
            style: TextStyle(color: Colors.white),
          );
        });
  }
}