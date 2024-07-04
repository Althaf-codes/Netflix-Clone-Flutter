part of 'recent_movie_bloc.dart';

sealed class RecentMovieBlocEvent extends Equatable {
  const RecentMovieBlocEvent();

  @override
  List<Object> get props => [];
}

final class GetRecentMovies extends RecentMovieBlocEvent {
  int page;
  GetRecentMovies({required this.page});
}
