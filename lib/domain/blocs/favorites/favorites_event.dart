part of 'favorites_bloc.dart';

abstract class FavoritesEvent extends Equatable {
  const FavoritesEvent();

  @override
  List<Object> get props => [];
}

class OnCodeFavoritesEvent extends FavoritesEvent {
  final String dataCode;
  const OnCodeFavoritesEvent(this.dataCode);
}

class OnDataIsLoadedEvent extends FavoritesEvent {}

class OnDataIsNotLoadedEvent extends FavoritesEvent {}
