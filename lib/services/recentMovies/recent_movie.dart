import 'package:netflix_clone/models/poster_model.dart';

abstract class RecentMovieService {
  Future<List<Poster>> getRecentMovies({required int pageNo});
}
