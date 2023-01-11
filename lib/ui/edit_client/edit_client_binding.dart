import 'package:get/get.dart';
import 'package:lombard/ui/edit_client/edit_client_controller.dart';

class EditClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EditClientController());
  }
}
