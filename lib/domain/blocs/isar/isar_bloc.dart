import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qbar_app/data/database/favorites.dart';

part 'isar_event.dart';
part 'isar_state.dart';

class IsarBloc extends Bloc<IsarEvent, IsarState> {

  late Isar isar;
  late List<Favorites> results = [];

  IsarBloc() : super(const IsarState()) {
    on<OnIsarInstanceEvent>((event, emit) => emit( state.copyWith( isar: event.isar )));
    on<OnFavoritesListEvent>((event, emit) => emit( state.copyWith( favorites: event.favorites )));
  }

  //Open an instance of the local Isar database
  void openAnInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      schemas: [FavoritesSchema],
      directory: dir.path,
      inspector: true
    );
    add(OnIsarInstanceEvent(isar));
  }

  //Insert a new favorite QR into the local Isar database
  void insertFavorite(String scanResult) async {
    final favorite = Favorites()
      ..qrscan    = scanResult
      ..timestamp = DateTime.now();

    //Insert the favorites QR into the database
    await state.isar!.writeTxn((isar) async {
      favorite.id = await isar.favoritess.put(favorite);
      print('✅ ${favorite.id}');
    });
  }

  //Get all the favorites QR from the local Isar database
  Future getAllFavorites() async {
    final allFavorites = await isar.favoritess.where().findAll();
    results = allFavorites;
    // .map((favorites) => Favorites.fromJson(favorites)).toList()
    add(OnFavoritesListEvent(results));
  }
  
}
