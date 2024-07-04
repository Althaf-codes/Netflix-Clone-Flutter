part of 'genre_movie_bloc.dart';

sealed class GenreMovieEvent extends Equatable {
  const GenreMovieEvent();

  @override
  List<Object> get props => [];
}

class GetMovieByGenre extends GenreMovieEvent {
  final int pageNo;
  final List<String> genre;
  const GetMovieByGenre({required this.genre, required this.pageNo});
}
