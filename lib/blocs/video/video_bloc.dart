import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/models/video_model.dart';
import 'package:netflix_clone/repositories/video_repo/video_repo.dart';

part 'video_event.dart';
part 'video_state.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepo videoRepo;
  Video? video;
  VideoBloc({required this.videoRepo}) : super(VideoInitial()) {
    on<GetVideo>(_getVideo);
  }

  FutureOr<void> _getVideo(GetVideo event, Emitter<VideoState> emit) async {
    try {
      emit(VideoLoading());
      video = await videoRepo.getvideo(videoid: event.videoId);
      print("the video in bloc is ${video!.id}");
      emit(VideoLoaded(video: video!));
    } catch (e) {
      emit(VideoFailure(message: e.toString()));
    }
  }
}
