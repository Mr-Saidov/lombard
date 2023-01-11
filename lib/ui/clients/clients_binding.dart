import 'package:get/get.dart';
import 'package:lombard/ui/clients/clients_controller.dart';

class ClientsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => ClientsController());
  }
}