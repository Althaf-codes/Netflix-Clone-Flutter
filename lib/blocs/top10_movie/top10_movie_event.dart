part of 'top10_movie_bloc.dart';

sealed class Top10MovieEvent extends Equatable {
  const Top10MovieEvent();

  @override
  List<Object> get props => [];
}

class GetTop10Movies extends Top10MovieEvent {}
