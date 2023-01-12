import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';
import 'package:lombard/ui/edit_product/edit_product_binding.dart';
import 'package:lombard/ui/edit_product/edit_product_page.dart';
import 'package:lombard/ui/products_by_client/product_by_client_controller.dart';
import 'package:lombard/utils/date_time_utils.dart';
import 'package:lombard/utils/utils.dart';

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
          Get.to(EditProductPage(clientTableData: clientTableData),
              binding: EditProductBinding());
        },
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder(
        stream: controller.streamAllProducts(clientTableData.id!),
        builder: (context, AsyncSnapshot<List<ProductTableData>> snapshot) {
          if (snapshot.data != null) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Tovarlar mavjud emas"),
              );
            } else {
              return ListView.separated(
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return ListTile(
                    title: Text(
                      "Tovar nomi: ${item.name}",
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Berilgan pul: ${item.gaveMoney}"),
                        Text(
                            "Qaytarish muddati: ${dateFormatter(item.endDate!)}"),
                      ],
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "${item.name}",
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            OutlinedButton(
                              child: Text("Tahrirlash"),
                              onPressed: () {
                                Get.back();
                                Get.to(
                                  EditProductPage(
                                    clientTableData: clientTableData,
                                    productTableData: item,
                                  ),
                                  binding: EditProductBinding(),
                                );
                              },
                            ),
                            OutlinedButton(
                              child: Text("O'chirish"),
                              onPressed: () {
                                Get.back();
                                showDeleteProductDialog(item, context);
                              },
                            ),
                            OutlinedButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                          ],
                          contentPadding: EdgeInsets.zero,
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              ListTile(
                                title: Text(
                                  "Berilgan pul: ${currencyFormatter(double.parse(item.gaveMoney!.replaceAll(" ", "")))}",
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Garovga qo'yilgan vaqt: ${dateFormatter(item.startDate!)}",
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  "Pulni qaytarish muddati: ${dateFormatter(item.endDate!)}",
                                ),
                              ),
                              ListTile(
                                title: Text("Foiz: ${item.percent} %"),
                              ),
                              ListTile(
                                title: Text(
                                    "Qaytariladigan pul: ${currencyFormatter((item.percent! + 100) / 100 * double.parse(item.gaveMoney!.replaceAll(" ", "")))}"),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            }
          } else {
            if (snapshot.hasError) {
              return Text(
                "Xatolik yuz berdi\n${snapshot.error}",
                textAlign: TextAlign.center,
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }

  void showDeleteProductDialog(ProductTableData item, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("${item.name}"),
        content: const Text("O'chirishni xohlaysizmi?"),
        actions: [
          OutlinedButton(
            onPressed: () => Get.back(),
            child: const Text("Bekor qilish"),
          ),
          if (item.id != null)
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
                primary: Colors.red,
              ),
              onPressed: () {
                Get.back();
                controller.deleteProduct(item.id!);
              },
              child: const Text("O'chirish"),
            ),
        ],
      ),
    );
  }
}
