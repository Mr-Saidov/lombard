import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';

class MainController extends GetxController {
  final AppDatabase _appDatabase = Get.find();

  streamAllClients() => _appDatabase.streamAllClients();

  void deleteClient(int id) {
    _appDatabase.deleteClient(id);
  }

  void deleteProductByClientId(int i) {
    _appDatabase.deleteProductByClientId(i);
  }
}
