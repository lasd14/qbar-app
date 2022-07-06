part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  
  final String dataCode;

  const FavoritesState({
    this.dataCode = '',
  });

  FavoritesState copyWith({
    String? dataCode,
  }) => FavoritesState(
    dataCode: dataCode ?? this.dataCode,
  );
  
  @override
  List<Object> get props => [ dataCode ];
}
