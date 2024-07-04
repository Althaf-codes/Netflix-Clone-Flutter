import 'package:netflix_clone/models/poster_model.dart';

abstract class SeriesRepo {
  Future<List<Poster>> getSeries({required int pageNo});
}
