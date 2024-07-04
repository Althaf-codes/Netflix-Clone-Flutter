import 'package:netflix_clone/models/video_model.dart';
import 'package:netflix_clone/repositories/video_repo/video_repo.dart';
import 'package:netflix_clone/services/video_service/video_service.dart';
import 'package:netflix_clone/services/video_service/video_service_impl.dart';

class VideoRepoImpl extends VideoRepo {
  final VideoService _videoService = VideoServiceImpl();
  @override
  Future<Video> getvideo({required String videoid}) async {
    Video video = await _videoService.getVideo(videoId: videoid);
    // Video video = Video.fromMap(res as Map<String, dynamic>);
    print("the video in repo is ${video.id}");

    return video;
  }
}
