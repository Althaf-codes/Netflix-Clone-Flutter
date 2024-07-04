part of 'series_bloc.dart';

sealed class SeriesEvent extends Equatable {
  const SeriesEvent();

  @override
  List<Object> get props => [];
}

class GetSeries extends SeriesEvent {
  final int pageNo;
  const GetSeries({required this.pageNo});
}
