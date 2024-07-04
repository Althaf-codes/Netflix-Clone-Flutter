import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/repositories/top10_repository/top10_movie_repo.dart';
import 'package:netflix_clone/services/recentMovies/recent_movie.dart';
import 'package:netflix_clone/services/recentMovies/recent_movie_impl.dart';
import 'package:netflix_clone/services/top10Movies/top10_movie.dart';
import 'package:netflix_clone/services/top10Movies/top10_movie_impl.dart';

class Top10MovieRepoImpl extends Top10MovieRepo {
  final Top10MovieService _top10movieService = Top10MovieServiceImpl();
  @override
  Future<List<Poster>> getTop10Movies() async {
    List<Poster> recentMovies = await _top10movieService.getTop10Movies();

    return recentMovies;
  }
}
