import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';
import 'package:lombard/ui/edit_product/edit_product_binding.dart';
import 'package:lombard/ui/edit_product/edit_product_page.dart';
import 'package:lombard/ui/products_by_client/product_by_client_controller.dart';

class ProductByClientPage extends GetView<ProductByClientController> {
  ProductByClientPage({Key? key, required this.clientTableData})
      : super(key: key);
  ClientTableData clientTableData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "${clientTableData.surname} ${clientTableData.name} ${clientTableData.middlename}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 16),
            ),
            const Text(
              "Garovga olingan tovarlar",
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(EditProductPage(), binding: EditProductBinding());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
