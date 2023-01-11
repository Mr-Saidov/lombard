import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lombard/data/local/db/app_database.dart';
import 'package:lombard/ui/clients/clients_controller.dart';
import 'package:lombard/ui/edit_client/edit_client_binding.dart';
import 'package:lombard/ui/edit_client/edit_client_page.dart';

class ClientsPage extends GetView<ClientsController> {
  const ClientsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mijozlar"),
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
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final item = snapshot.data![index];
                  return ListTile(
                    title:
                        Text("${item.name} ${item.surname} ${item.middlename}"),
                    subtitle: Text("JSHSHIR: ${item.pinfl}"),
                    trailing: IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () {
                          Get.to(
                            EditClientPage(clientTableData: item),
                            binding: EditClientBinding(),
                          );
                        }),
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
}
