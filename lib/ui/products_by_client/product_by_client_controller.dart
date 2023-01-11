import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';

class ProductByClientController extends GetxController {
  final AppDatabase _appDatabase = Get.find();

  streamAllProducts(int clientId) =>
      _appDatabase.streamAllProductsByClientId(clientId);

  void deleteProduct(int i) {
    _appDatabase.deleteProduct(i);
  }
}
