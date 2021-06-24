import 'movie.dart';

class StateMovie {
  final int idStatus;
  final String title;
  final List<Movie> movieList;

  StateMovie({this.idStatus, this.title, this.movieList});

  factory StateMovie.fromJson(Map<String, dynamic> json) {
    return StateMovie(
        idStatus: json.containsKey("id_status") ? json["id_status"] : null,
        title: json.containsKey("title") ? json["title"] : null,
        movieList: Movie.getListFormJson(json["movies"])
    );
  }

  static List<StateMovie> getListFormJson(List json) {
    List<StateMovie> stateMovieList = [];
    for (Map<String, dynamic> item in json) {
      stateMovieList.add(StateMovie.fromJson(item));
    }
    return stateMovieList;
  }
}

class Metadata {
  final List<StateMovie> result;
  final StateMovie banner;

  Metadata({this.result, this.banner});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
        result: StateMovie.getListFormJson(json["result"]),
        banner: StateMovie.fromJson(json["banner"]),
    );
  }
}