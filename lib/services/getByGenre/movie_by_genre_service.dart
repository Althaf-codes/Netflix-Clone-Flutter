import 'package:netflix_clone/models/poster_model.dart';

abstract class MovieByGenreService {
  Future<List<Poster>> getMovieByGenre(
      {required int pageNo, required List<String> genre});
}
