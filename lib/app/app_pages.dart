import 'package:get/get.dart';
import 'package:lombard/app/app_routes.dart';
import 'package:lombard/ui/main/main_controller.dart';
import 'package:lombard/ui/main/main_page.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.MAIN,
      page: () => MainPage(),
      binding: BindingsBuilder(() => Get.put(() => MainController())),
    ),
    // GetPage(
    //   name: Routes.COURSE,
    //   page: () => SectionsPage(
    //     course: null,
    //     index: 0,
    //   ),
    //   binding: BindingsBuilder(() => Get.put(() => SectionsController())),
    // ),
  ];
}
