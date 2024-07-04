import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/repositories/recent_movie_repository/recent_movie_repo.dart';
import 'package:netflix_clone/services/recentMovies/recent_movie.dart';
import 'package:netflix_clone/services/recentMovies/recent_movie_impl.dart';

class RecentMovieRepoImpl extends RecentMovieRepo {
  final RecentMovieService _recentMovieService = RecentMovieServiceImpl();

  @override
  Future<List<Poster>> getRecentMovies({required int pageNo}) async {
    List<Poster> recentMovies =
        await _recentMovieService.getRecentMovies(pageNo: pageNo);

    return recentMovies;
  }
}
