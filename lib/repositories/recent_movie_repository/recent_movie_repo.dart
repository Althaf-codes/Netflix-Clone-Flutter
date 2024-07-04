import 'package:netflix_clone/models/poster_model.dart';

abstract class RecentMovieRepo {
  Future<List<Poster>> getRecentMovies({required int pageNo});
}
