part of 'history_bloc.dart';

abstract class HistoryEvent extends Equatable {
  const HistoryEvent();

  @override
  List<Object> get props => [];
}

class OnCodeHistoryEvent extends HistoryEvent {
  final String dataCodeHistory;
  const OnCodeHistoryEvent(this.dataCodeHistory);
}