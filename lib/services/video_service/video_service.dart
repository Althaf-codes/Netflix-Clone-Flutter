import 'package:netflix_clone/models/video_model.dart';

abstract class VideoService {
  Future<Video> getVideo({required String videoId});
}
