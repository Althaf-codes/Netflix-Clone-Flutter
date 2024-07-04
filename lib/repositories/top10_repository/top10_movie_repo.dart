import 'package:netflix_clone/models/poster_model.dart';

abstract class Top10MovieRepo {
  Future<List<Poster>> getTop10Movies();
}
