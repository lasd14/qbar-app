part of 'isar_bloc.dart';

class IsarState extends Equatable {

  final Isar? isar;
  final List<Favorites> favorites;

  const IsarState({
    this.isar,
    this.favorites = const [],
  });

  IsarState copyWith({
    Isar? isar,
    List<Favorites>? favorites,
  }) => IsarState(
    isar: isar ?? this.isar,
    favorites: favorites ?? this.favorites,
  );
  
  @override
  List<Object?> get props => [ isar, favorites ];
}
