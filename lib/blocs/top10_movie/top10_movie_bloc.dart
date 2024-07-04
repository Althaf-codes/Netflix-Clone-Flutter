import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/repositories/top10_repository/top10_movie_repo.dart';

part 'top10_movie_event.dart';
part 'top10_movie_state.dart';

class Top10MovieBloc extends Bloc<Top10MovieEvent, Top10MovieState> {
  final Top10MovieRepo top10movieRepo;
  List<Poster>? posters;
  Top10MovieBloc({required this.top10movieRepo}) : super(Top10MovieInitial()) {
    on<GetTop10Movies>(_getTop10Movies);
  }

  FutureOr<void> _getTop10Movies(
      GetTop10Movies event, Emitter<Top10MovieState> emit) async {
    try {
      emit(Top10MovieLoading());
      posters = await top10movieRepo.getTop10Movies();
      emit(Top10MovieLoaded(posters: posters!));
    } catch (e) {
      emit(Top10MovieFailure(message: e.toString()));
    }
  }
}
