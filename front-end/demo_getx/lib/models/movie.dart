import 'package:flutter/material.dart';

class Video {
  final int number;
  final String url;

  Video({this.number, this.url});

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      number: json["number"],
      url: json["url"],
    );
  }

  static List<Video> getListFormJson(List json) {
    List<Video> videos = [];
    for (Map<String, dynamic> item in json) {
      videos.add(Video.fromJson(item));
    }
    return videos;
  }
}

class Movie {
  final String id;
  final String title, description;
  final String images;
  final String banner;
  bool isFavorite;
  final int episodeNumber;
  final List<Video> video;

  Movie({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.images,
    @required this.banner,
    @required this.episodeNumber,
    this.video,
    this.isFavorite = false
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["_id"],
      title: json["title"],
      description: json["description"],
      images: json["images"],
      banner: json["banner"],
      episodeNumber: json["episode_number"],
      isFavorite: json["is_favorite"],
      video: json.containsKey("videos") ? Video.getListFormJson(json["videos"]) : null,
    );
  }

  static List<Movie> getListFormJson(List json) {
    List<Movie> movies = [];
    for (Map<String, dynamic> item in json) {
      movies.add(Movie.fromJson(item));
    }
    return movies;
  }
}