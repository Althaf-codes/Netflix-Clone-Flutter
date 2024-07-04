import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:netflix_clone/models/poster_model.dart';
import 'package:netflix_clone/repositories/series_repository/series_repo.dart';

part 'series_event.dart';
part 'series_state.dart';

class SeriesBloc extends Bloc<SeriesEvent, SeriesState> {
  final SeriesRepo seriesRepo;
  List<Poster>? posters;
  SeriesBloc({required this.seriesRepo}) : super(SeriesInitial()) {
    on<GetSeries>(_getSeries);
  }

  FutureOr<void> _getSeries(GetSeries event, Emitter<SeriesState> emit) async {
    try {
      emit(SeriesLoading());

      posters = await seriesRepo.getSeries(pageNo: event.pageNo);
      emit(SeriesLoaded(posters: posters!));
    } catch (e) {
      emit(SeriesFailure(message: e.toString()));
    }
  }
}
