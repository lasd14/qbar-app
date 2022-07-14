part of 'favorites_bloc.dart';

class FavoritesState extends Equatable {
  
  final String dataCode;
  final bool isLoaded;

  const FavoritesState({
    this.dataCode = '',
    this.isLoaded = false,
  });

  FavoritesState copyWith({
    String? dataCode,
    bool? isLoaded,
  }) => FavoritesState(
    dataCode: dataCode ?? this.dataCode,
    isLoaded: isLoaded ?? this.isLoaded,
  );
  
  @override
  List<Object> get props => [ dataCode, isLoaded ];
}
