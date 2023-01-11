import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lombard/ui/edit_product/edit_product_controller.dart';

class EditProductPage extends GetView<EditProductController> {
  const EditProductPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            controller: controller.productCostController,
            onChanged: (a) => controller.checkReady(),
            maxLines: 1,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              hintText: "Tovar qiymati",
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
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              hintText: "Beriladigan summa",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
          GestureDetector(
            onTap: () {
              final startDate = DateTime.now();
              final endDate = startDate.millisecondsSinceEpoch +
                  12 * 30 * 24 * 60 * 60 * 1000;
              showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.fromMillisecondsSinceEpoch(endDate));
            },
            child: TextField(
              controller: controller.startDateController,
              onChanged: (a) => controller.checkReady(),
              maxLines: 1,
              enabled: false,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              decoration: InputDecoration(
                hintText: "Garovga qo'yilgan vaqt",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          getDivider(),
          TextField(
            controller: controller.endDateController,
            onChanged: (a) => controller.checkReady(),
            enabled: false,
            onTap: () {},
            maxLines: 1,
            inputFormatters: [LengthLimitingTextInputFormatter(50)],
            decoration: InputDecoration(
              hintText: "Pulni qaytarish muddati",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
          getDivider(),
        ],
      ),
    );
  }

  getDivider() => const SizedBox(height: 8);
}
