import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/repositories/recent_movie_repository/recent_movie_repo.dart';

part 'recent_movie_bloc_event.dart';
part 'recent_movie_bloc_state.dart';

class RecentMovieBloc extends Bloc<RecentMovieBlocEvent, RecentMovieBlocState> {
  final RecentMovieRepo recentMovieRepo;
  List<Poster>? _recentMovies;
  RecentMovieBloc({required this.recentMovieRepo})
      : super(RecentMovieBlocInitial()) {
    on<GetRecentMovies>(_getRecentMovies);
  }

  FutureOr<void> _getRecentMovies(
      GetRecentMovies event, Emitter<RecentMovieBlocState> emit) async {
    try {
      emit(RecentMovieBlocLoading());
      _recentMovies = await recentMovieRepo.getRecentMovies(pageNo: event.page);
      emit(RecentMovieBlocLoaded(posters: _recentMovies!));
    } catch (e) {
      emit(RecentMovieBlocFailure(message: e.toString()));
    }
  }
}
