import 'package:netflix_clone/models/poster_model.dart';

abstract class SeriesService {
  Future<dynamic> getSeries({required int pageNo});
}
