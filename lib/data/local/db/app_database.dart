import 'package:drift/drift.dart';
import 'package:lombard/data/local/db/tables/client.dart';
import 'package:lombard/data/local/db/tables/product.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [ClientTable, ProductTable])
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

  void insertProduct(ProductTableData productTableData) => into(productTable)
      .insert(productTableData, mode: InsertMode.insertOrReplace);

  Stream<List<ClientTableData>> streamAllClients() => (select(clientTable)
        ..orderBy(
            [(u) => OrderingTerm(expression: u.name, mode: OrderingMode.asc)]))
      .watch();

  Stream<List<ProductTableData>> streamAllProductsByClientId(int clientId) {
    return (select(productTable)
          ..where((t) => t.clientId.equals(clientId))
          ..orderBy([
            (u) => OrderingTerm(expression: u.name, mode: OrderingMode.asc)
          ]))
        .watch();
  }

  void deleteClient(int id) {
    (delete(clientTable)..where((tbl) => clientTable.id.equals(id))).go();
  }

  void deleteProduct(int id) {
    (delete(productTable)..where((tbl) => productTable.id.equals(id))).go();
  }
  void deleteProductByClientId(int id) {
    (delete(productTable)..where((tbl) => productTable.clientId.equals(id))).go();
  }
}
