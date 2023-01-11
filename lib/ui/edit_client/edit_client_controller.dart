import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';

class EditClientController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController middleNameController = TextEditingController();
  TextEditingController pinflController = TextEditingController();
  var isReadyToSave = false.obs;
  AppDatabase appDatabase = Get.find();
  ClientTableData? clientTableData;

  @override
  void onInit() {
    super.onInit();
  }

  checkReady() {
    isReadyToSave.value = !(nameController.text.trim().toString().isEmpty ||
        surnameController.text.trim().isEmpty ||
        middleNameController.text.trim().isEmpty ||
        pinflController.text.trim().isEmpty);
  }

  saveClient() => appDatabase.insertClient(
        ClientTableData(
          id: clientTableData?.id,
          name: nameController.text,
          middlename: middleNameController.text,
          pinfl: pinflController.text,
          surname: surnameController.text,
        ),
      );

  void refreshTextEditingControllers() {
    nameController.text = clientTableData?.name ?? "";
    surnameController.text = clientTableData?.surname ?? "";
    middleNameController.text = clientTableData?.middlename ?? "";
    pinflController.text = clientTableData?.pinfl ?? "";
  }
}
