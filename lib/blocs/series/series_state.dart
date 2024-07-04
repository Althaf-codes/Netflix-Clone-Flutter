part of 'series_bloc.dart';

sealed class SeriesState extends Equatable {
  const SeriesState();

  @override
  List<Object> get props => [];
}

final class SeriesInitial extends SeriesState {}

final class SeriesLoading extends SeriesState {}

final class SeriesLoaded extends SeriesState {
  final List<Poster> posters;
  const SeriesLoaded({required this.posters});
}

final class SeriesFailure extends SeriesState {
  final String message;
  const SeriesFailure({required this.message});
}
