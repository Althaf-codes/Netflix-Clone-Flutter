import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/repositories/getByGenre/movie_by_genre_repo.dart';
import 'package:netflix_clone/services/getByGenre/movie_by_genre_impl.dart';
import 'package:netflix_clone/services/getByGenre/movie_by_genre_service.dart';

class MovieByGenreRepoImpl extends MovieByGenreRepo {
  final MovieByGenreService _getMovieByGenreService = MovieByGenreServiceImpl();
  @override
  Future<List<Poster>> getMovieByGenre(
      {required int pageNo, required List<String> genre}) async {
    List<Poster> genreMovies = await _getMovieByGenreService.getMovieByGenre(
        pageNo: pageNo, genre: genre);
    return genreMovies;
  }
}
