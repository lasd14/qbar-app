import 'package:isar/isar.dart';
part 'favorites.g.dart';

@Collection()
class Favorites{
  int id = Isar.autoIncrement;
  late String qrscan;
  late DateTime timestamp;
}