import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/repositories/getByGenre/movie_by_genre_repo.dart';

part 'genre_movie_event.dart';
part 'genre_movie_state.dart';

class GenreMovieBloc extends Bloc<GenreMovieEvent, GenreMovieState> {
  List<Poster>? _posters;
  final MovieByGenreRepo movieByGenreRepo;
  GenreMovieBloc({required this.movieByGenreRepo})
      : super(GenreMovieInitial()) {
    on<GetMovieByGenre>(_getMovieByGenre);
  }

  FutureOr<void> _getMovieByGenre(
      GetMovieByGenre event, Emitter<GenreMovieState> emit) async {
    try {
      emit(GenreMovieInitial());
      _posters = await movieByGenreRepo.getMovieByGenre(
          pageNo: event.pageNo, genre: event.genre);

      emit(GenreMovieLoaded(poster: _posters!));
    } catch (e) {
      emit(GenreMovieFailure(message: e.toString()));
    }
  }
}
