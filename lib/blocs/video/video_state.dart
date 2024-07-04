part of 'video_bloc.dart';

sealed class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

final class VideoInitial extends VideoState {}

final class VideoLoading extends VideoState {}

final class VideoLoaded extends VideoState {
  final Video video;
  const VideoLoaded({required this.video});
}

final class VideoFailure extends VideoState {
  final String message;
  const VideoFailure({required this.message});
}
