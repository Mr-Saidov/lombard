import 'package:drift/drift.dart';

class ClientTable extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get name => text().nullable()();

  TextColumn get surname => text().nullable()();

  TextColumn get middlename => text().nullable()();

  TextColumn get pinfl => text().nullable()();
}
