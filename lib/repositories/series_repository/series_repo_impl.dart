import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/repositories/series_repository/series_repo.dart';
import 'package:netflix_clone/services/series/series_service.dart';
import 'package:netflix_clone/services/series/series_service_impl.dart';

class SeriesRepoImpl extends SeriesRepo {
  final SeriesService _seriesService = SeriesServiceImpl();
  @override
  Future<List<Poster>> getSeries({required int pageNo}) async {
    List<dynamic> series = await _seriesService.getSeries(pageNo: pageNo);

    List<Poster> allSeries = series
        .map((res) => Poster.fromMap(res as Map<String, dynamic>))
        .toList();

    return allSeries;
  }
}
