import 'package:drift/drift.dart';
import 'package:lombard/data/local/db/tables/client.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [
  ClientTable,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase(QueryExecutor executor) : super(
            // EncryptedExecutor.inDatabaseFolder(
            //   path: "app.db",
            //   logStatements: true,
            //   singleInstance: true,
            //   password: "goCoder_Pass",
            // ),
            executor);

  @override
  int get schemaVersion => 1;

  void insertClient(ClientTableData clientTableData) => into(clientTable)
      .insert(clientTableData, mode: InsertMode.insertOrReplace);

  Stream<List<ClientTableData>> streamAllClients() => (select(clientTable)
        ..orderBy(
            [(u) => OrderingTerm(expression: u.name, mode: OrderingMode.asc)]))
      .watch();

  void deleteClient(int id) {
    (delete(clientTable)..where((tbl) => clientTable.id.equals(id))).go();
  }
}
