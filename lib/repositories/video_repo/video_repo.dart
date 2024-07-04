import 'package:netflix_clone/models/video_model.dart';

abstract class VideoRepo {
  Future<Video> getvideo({required String videoid});
}
