import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';
import 'package:lombard/ui/edit_client/edit_client_controller.dart';

class EditClientPage extends GetView<EditClientController> {
  EditClientPage({this.clientTableData, Key? key}) : super(key: key);
  ClientTableData? clientTableData;

  @override
  Widget build(BuildContext context) {
    controller.clientTableData = clientTableData;
    controller.refreshTextEditingControllers();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          clientTableData != null ? "Mijozni tahrirlash" : "Mijoz qo'shish",
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
            controller: controller.surnameController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            autofocus: true,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              labelText: "Familiyasi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            textInputAction: TextInputAction.next,
          ),
          SizedBox(height: 4),
          TextField(
            controller: controller.nameController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              labelText: "Ismi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            textInputAction: TextInputAction.next,
          ),
          const SizedBox(height: 4),
          TextField(
            controller: controller.middleNameController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Otasining ismi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 4),
          TextField(
            controller: controller.pinflController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            inputFormatters: [LengthLimitingTextInputFormatter(9)],
            decoration: InputDecoration(
              labelText: "Passport ma'lumotlari (JSHSHIR)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          SizedBox(height: 4),
        ],
      ),
      floatingActionButton: Obx(
        () => controller.isReadyToSave.value
            ? FloatingActionButton(
                onPressed: () async {
                  await controller.saveClient();
                  Get.back();
                },
                child: const Icon(Icons.done),
              )
            : Container(),
      ),
    );
  }
}
