part of 'recent_movie_bloc.dart';

sealed class RecentMovieBlocState extends Equatable {
  const RecentMovieBlocState();

  @override
  List<Object> get props => [];
}

final class RecentMovieBlocInitial extends RecentMovieBlocState {}

final class RecentMovieBlocLoading extends RecentMovieBlocState {}

final class RecentMovieBlocLoaded extends RecentMovieBlocState {
  final List<Poster> posters;
  const RecentMovieBlocLoaded({required this.posters});
}

final class RecentMovieBlocFailure extends RecentMovieBlocState {
  String message;
  RecentMovieBlocFailure({required this.message});
}
