import 'package:demo_getx/models/movie.dart';
import 'package:demo_getx/service/movie_service.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FindMovieController extends GetxController {
  var isLoading = true.obs;
  var movies = RxList<Movie>();
  RefreshController refreshController = RefreshController();

  @override
  void onInit() {
    fetchFinalMovieTop();
    super.onInit();
  }

  void fetchFinalMovieTop() async {
    isLoading(true);
    try {
      var data = await MovieService.getMovieTop();
      if (data != null)
        movies.call(data);
      update();
    } finally {
      refreshController.refreshCompleted();
      isLoading(false);
    }
  }
}