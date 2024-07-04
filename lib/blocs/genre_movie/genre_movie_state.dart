part of 'genre_movie_bloc.dart';

sealed class GenreMovieState extends Equatable {
  const GenreMovieState();

  @override
  List<Object> get props => [];
}

final class GenreMovieInitial extends GenreMovieState {}

final class GenreMovieLoading extends GenreMovieState {}

final class GenreMovieLoaded extends GenreMovieState {
  List<Poster> poster;

  GenreMovieLoaded({required this.poster});
}

final class GenreMovieFailure extends GenreMovieState {
  final String message;
  const GenreMovieFailure({required this.message});
}
