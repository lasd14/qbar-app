part of 'isar_bloc.dart';

class IsarState extends Equatable {

  final Isar? isar;
  final List<Favorites> favorites;
  final List<Histories> histories;

  const IsarState({
    this.isar,
    this.favorites = const [],
    this.histories = const [],
  });

  IsarState copyWith({
    Isar? isar,
    List<Favorites>? favorites,
    List<Histories>? histories,
  }) => IsarState(
    isar: isar ?? this.isar,
    favorites: favorites ?? this.favorites,
    histories: histories ?? this.histories,
  );
  
  @override
  List<Object?> get props => [ isar, favorites, histories ];
}
