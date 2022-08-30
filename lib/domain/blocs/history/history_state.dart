part of 'history_bloc.dart';

class HistoryState extends Equatable {

  final String dataCodeHistory;
  final bool isLoadedHistory;

  const HistoryState({
    this.dataCodeHistory = '',
    this.isLoadedHistory = false,
  });

  HistoryState copyWith({
    String? dataCodeHistory,
    bool? isLoadedHistory,
  }) => HistoryState(
    dataCodeHistory: dataCodeHistory ?? this.dataCodeHistory,
    isLoadedHistory: isLoadedHistory ?? this.isLoadedHistory,
  );
  
  @override
  List<Object> get props => [ dataCodeHistory, isLoadedHistory ];
}