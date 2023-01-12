import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';

class EditProductController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController gaveMoneyController = TextEditingController();
  var startDate = DateTime.fromMillisecondsSinceEpoch(0).obs;
  var endDate = DateTime.fromMillisecondsSinceEpoch(0).obs;
  var isReadyToSave = false.obs;
  var percent = 20.0.obs;
  AppDatabase appDatabase = Get.find();
  late ClientTableData clientTableData;
  ProductTableData? productTableData;

  checkReady() {
    isReadyToSave.value = nameController.text.trim().isNotEmpty &&
        gaveMoneyController.text.trim().isNotEmpty &&
        startDate.value.millisecondsSinceEpoch != 0 &&
        endDate.value.millisecondsSinceEpoch != 0;
    percent.refresh();
  }

  Future saveProduct() async => appDatabase.insertProduct(
        ProductTableData(
            id: productTableData?.id,
            name: nameController.text.trim(),
            clientId: clientTableData.id,
            percent: percent.value.toInt(),
            gaveMoney: gaveMoneyController.text.trim(),
            startDate: startDate.value,
            endDate: endDate.value),
      );

  void refreshControllers() {
    nameController.text = productTableData!.name!;
    gaveMoneyController.text = productTableData!.gaveMoney!;
    startDate.value = productTableData!.startDate!;
    endDate.value = productTableData!.endDate!;
    percent.value = productTableData!.percent!.toDouble();
    checkReady();
  }
}
