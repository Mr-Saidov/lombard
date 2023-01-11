import 'package:drift/drift.dart';

class ProductTable extends Table {
  IntColumn get id => integer().autoIncrement().nullable()();

  TextColumn get name => text().nullable()();

  TextColumn get cost => text().nullable()();

  TextColumn get gaveMoney => text().nullable()();

  DateTimeColumn get startDate => dateTime().nullable()();

  DateTimeColumn get endDate => dateTime().nullable()();
}
