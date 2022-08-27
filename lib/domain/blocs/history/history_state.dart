part of 'history_bloc.dart';

class HistoryState extends Equatable {

  final String dataCodeHistory;

  const HistoryState({
    this.dataCodeHistory = ''
  });

  HistoryState copyWith({
    String? dataCodeHistory
  }) => HistoryState(
    dataCodeHistory: dataCodeHistory ?? this.dataCodeHistory
  );
  
  @override
  List<Object> get props => [ dataCodeHistory ];
}