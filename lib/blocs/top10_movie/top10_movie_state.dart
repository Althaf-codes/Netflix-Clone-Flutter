part of 'top10_movie_bloc.dart';

sealed class Top10MovieState extends Equatable {
  const Top10MovieState();

  @override
  List<Object> get props => [];
}

final class Top10MovieInitial extends Top10MovieState {}

final class Top10MovieLoading extends Top10MovieState {}

final class Top10MovieLoaded extends Top10MovieState {
  final List<Poster> posters;
  const Top10MovieLoaded({required this.posters});
}

final class Top10MovieFailure extends Top10MovieState {
  final String message;
  const Top10MovieFailure({required this.message});
}
