import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';

class ClientsController extends GetxController{
  final AppDatabase _appDatabase = Get.find();

  streamAllClients() => _appDatabase.streamAllClients();

}