import 'package:get/get.dart';
import 'package:lombard/ui/products_by_client/product_by_client_controller.dart';

class ProductByClientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductByClientController());
  }
}
