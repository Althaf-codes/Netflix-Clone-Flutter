part of 'video_bloc.dart';

sealed class VideoEvent extends Equatable {
  const VideoEvent();

  @override
  List<Object> get props => [];
}

final class GetVideo extends VideoEvent {
  final String videoId;
  const GetVideo({required this.videoId});
}
