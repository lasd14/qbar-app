import 'package:isar/isar.dart';
part 'tables.g.dart';

@Collection()
class Favorites{
  int id = Isar.autoIncrement;
  late String qrscan;
  late DateTime timestamp;
}

@Collection()
class Histories{
  int id = Isar.autoIncrement;
  late String qrscan;
  late DateTime timestamp;
}