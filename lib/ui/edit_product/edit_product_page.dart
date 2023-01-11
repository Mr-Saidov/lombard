import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';
import 'package:lombard/ui/edit_product/edit_product_controller.dart';
import 'package:lombard/utils/date_time_utils.dart';
import 'package:lombard/utils/utils.dart';
import 'package:money_input_formatter/money_input_formatter.dart';

class EditProductPage extends GetView<EditProductController> {
  EditProductPage({Key? key, required this.clientTableData, this.productTableData}) : super(key: key);
  ClientTableData clientTableData;
  ProductTableData? productTableData;

  @override
  Widget build(BuildContext context) {
    controller.clientTableData = clientTableData;
    controller.productTableData = productTableData;
    if (productTableData != null) {
      controller.refreshControllers();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tovar ma'lumotlari"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          TextField(
            controller: controller.nameController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              hintText: "Tovar nomi",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          TextField(
            controller: controller.gaveMoneyController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            inputFormatters: [MoneyInputFormatter()],
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            decoration: InputDecoration(
              hintText: "Beriladigan summa",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          InkWell(
            onTap: () async {
              final startDate = DateTime.now();
              final endDate = startDate.millisecondsSinceEpoch +
                  12 * 30 * 24 * 60 * 60 * 1000;
              final r = await showDatePicker(
                context: context,
                initialDate: controller.startDate.value ==
                    DateTime.fromMillisecondsSinceEpoch(0)?DateTime.now():controller.startDate.value,
                firstDate: DateTime.now(),
                lastDate: DateTime.fromMillisecondsSinceEpoch(endDate),
              );
              if (r == null) {
                controller.startDate.value = DateTime.now();
              } else {
                controller.startDate.value = r;
              }
              controller.checkReady();
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Garovga qo'yilgan vaqt",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() {
                      return Text(
                        controller.startDate.value ==
                                DateTime.fromMillisecondsSinceEpoch(0)
                            ? "Tanlanmagan"
                            : dateFormatter(controller.startDate.value),
                      );
                    }),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
          getDivider(),
          InkWell(
            onTap: () async {
              final startDate = DateTime.now();
              final endDate = startDate.millisecondsSinceEpoch +
                  12 * 30 * 24 * 60 * 60 * 1000;
              final r = await showDatePicker(
                context: context,
                initialDate:  controller.endDate.value ==
                    DateTime.fromMillisecondsSinceEpoch(0)?DateTime.now():controller.endDate.value,
                firstDate: DateTime.now(),
                lastDate: DateTime.fromMillisecondsSinceEpoch(endDate),
              );
              if (r == null) {
                controller.endDate.value = DateTime.now();
              } else {
                controller.endDate.value = r;
              }
              controller.checkReady();
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(12)),
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Pulni qaytarish muddati",
                    style: TextStyle(color: Colors.black54),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Obx(() {
                      return Text(
                        controller.endDate.value ==
                                DateTime.fromMillisecondsSinceEpoch(0)
                            ? "Tanlanmagan"
                            : dateFormatter(controller.endDate.value),
                      );
                    }),
                  ),
                  const SizedBox(height: 6),
                ],
              ),
            ),
          ),
          getDivider(),
          Obx(
            () => Slider(
              label: "${controller.percent.value.toInt()} %",
              value: controller.percent.value,
              onChanged: (a) {
                controller.percent.value = a;
              },
              max: 100,
              min: 0,
              divisions: 100,
            ),
          ),
          Center(child: Obx(() {
            return Text(
              "Foiz: ${controller.percent.value.toInt()} %",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            );
          })),
          getDivider(),
          Center(
            child: Obx(
              () {
                final percent = controller.percent.value;
                final gaveMoney =
                    controller.gaveMoneyController.text.replaceAll(" ", "");
                if (gaveMoney.isEmpty) return const Text("");
                return Text(
                  "Qaytariladigan summa:\n${currencyFormatter(((percent.toInt() + 100) / 100 * double.parse(gaveMoney)).toPrecision(2))} ",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Obx(
        () {
          return controller.isReadyToSave.value
              ? FloatingActionButton(
                  onPressed: () async {
                    await controller.saveProduct();
                    Get.back();
                  },
                  child: const Icon(Icons.done),
                )
              : Container();
        },
      ),
    );
  }

  getDivider() => const SizedBox(height: 8);
}
