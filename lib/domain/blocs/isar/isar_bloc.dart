import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:qbar_app/data/database/tables.dart';

part 'isar_event.dart';
part 'isar_state.dart';

class IsarBloc extends Bloc<IsarEvent, IsarState> {

  late Isar isar;
  late List<Favorites> resultsFavorites = [];
  late List<Histories> resultsHistories = [];

  IsarBloc() : super(const IsarState()) {
    on<OnIsarInstanceEvent>((event, emit) => emit( state.copyWith( isar: event.isar )));
    on<OnFavoritesListEvent>((event, emit) => emit( state.copyWith( favorites: event.favorites )));
    on<OnHistoriesListEvent>((event, emit) => emit( state.copyWith( histories: event.histories )));
  }

  //Open an instance of the local Isar database
  void openAnInstance() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      schemas: [FavoritesSchema, HistoriesSchema],
      directory: dir.path,
      inspector: true
    );
    add(OnIsarInstanceEvent(isar));
  }

  // --------------- Favorites ----------------

  //Insert a new favorite QR into the local Isar database
  void insertFavorite(String scanResult) async {
    final favorite = Favorites()
      ..qrscan    = scanResult
      ..timestamp = DateTime.now();

    //Insert the favorites QR into the database
    await state.isar!.writeTxn((isar) async {
      favorite.id = await isar.favoritess.put(favorite);
      print('✅ ${DateTime.now().day} ${favorite.id}');
    });
  }

  //Get all the favorites QR from the local Isar database
  Future getAllFavorites() async {
    final allFavorites = await isar.favoritess.where().findAll();
    resultsFavorites = allFavorites;
    // .map((favorites) => Favorites.fromJson(favorites)).toList()
    add(OnFavoritesListEvent(resultsFavorites));
  }

  // --------------- History ----------------
  
  //Insert a new history QR into the local Isar database
  void insertHistory(String scanResult) async {
    final history = Histories()
      ..qrscan    = scanResult
      ..timestamp = DateTime.now();

    //Insert the history QR into the database
    await state.isar!.writeTxn((isar) async {
      history.id = await isar.historiess.put(history);
      print('✅ ${DateTime.now().day} ${history.id}');
    });
  }

  Future getAllHistories() async {
    final allHistories = await isar.historiess.where().findAll();
    resultsHistories = allHistories;
    // .map((favorites) => Favorites.fromJson(favorites)).toList()
    add(OnHistoriesListEvent(resultsHistories));
  }

}
