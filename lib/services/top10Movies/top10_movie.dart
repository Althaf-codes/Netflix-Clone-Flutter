import 'package:netflix_clone/models/poster_model.dart';

abstract class Top10MovieService {
  Future<List<Poster>> getTop10Movies();
}
