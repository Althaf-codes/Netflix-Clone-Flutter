import 'package:netflix_clone/models/poster_model.dart';

abstract class MovieByGenreRepo {
  Future<List<Poster>> getMovieByGenre(
      {required int pageNo, required List<String> genre});
}
