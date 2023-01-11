import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';
import 'package:lombard/ui/clients/clients_binding.dart';
import 'package:lombard/ui/clients/clients_page.dart';
import 'package:lombard/ui/edit_client/edit_client_binding.dart';
import 'package:lombard/ui/edit_client/edit_client_page.dart';
import 'package:lombard/ui/main/main_controller.dart';
import 'package:lombard/ui/products_by_client/product_by_client_binding.dart';
import 'package:lombard/ui/products_by_client/product_by_client_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    "NFT Lombard",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            ListTile(
              title: const Text("Mijozlar"),
              onTap: () {
                Get.back();
                Get.to(ClientsPage(), binding: ClientsBinding());
              },
            ),
            const Divider(
              height: 1,
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text("NFT Lombard"),
      ),
      body: StreamBuilder(
        stream: controller.streamAllClients(),
        builder: (context, AsyncSnapshot<List<ClientTableData>> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return const Center(
                child: Text("Mijozlar mavjud emas"),
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
                      "${item.surname} ${item.name} ${item.middlename}",
                    ),
                    subtitle: Text("JSHSHIR: ${item.pinfl}"),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            "${item.surname} ${item.name} ${item.middlename}",
                          ),
                          actions: [
                            OutlinedButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Get.back();
                              },
                            )
                          ],
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                title: Text("Tahrirlash"),
                                onTap: () {
                                  Get.back();
                                  Get.to(
                                    EditClientPage(clientTableData: item),
                                    binding: EditClientBinding(),
                                  );
                                },
                              ),
                              ListTile(
                                title: Text("O'chirish"),
                                onTap: () {
                                  Get.back();
                                  showDeleteClientDialog(item, context);
                                },
                              ),
                              ListTile(
                                title: Text("Garovga olingan tovarlar"),
                                onTap: () {
                                  Get.back();
                                  Get.to(
                                    ProductByClientPage(clientTableData: item),
                                    binding: ProductByClientBinding(),
                                  );
                                },
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
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(EditClientPage(), binding: EditClientBinding());
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void showDeleteClientDialog(ClientTableData item, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          "${item.surname} ${item.name} ${item.middlename}",
        ),
        content: const Text(
            "\t\tMijoz ma'lumotlarini rostdan ham o'chirmoqchimisiz?\n\t\tBunda mijozga tegishli garovga qo'yilgan tovarlar ma'lumotlari ham o'chib ketadi"),
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
                controller.deleteClient(item.id!);
              },
              child: const Text("O'chirish"),
            ),
        ],
      ),
    );
  }
}
