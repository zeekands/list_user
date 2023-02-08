import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:list_user/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List User'),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: search(controller.listUsers.value),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.dialog(
              AlertDialog(
                title: const Text('About'),
                content: const Text(
                  'This app is made by aziz kandias as a technical test submission',
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          },
          icon: const Icon(Icons.info_outline_rounded),
        ),
      ),
      body: controller.obx(
        (state) => ListView.builder(
          itemCount: controller.listUsers.value.data?.length,
          itemBuilder: (context, index) {
            var data = controller.listUsers.value.data!;
            return ListTile(
              onTap: () => Get.toNamed(
                Routes.DETAIL,
                arguments: data[index].id,
              ),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(data[index].avatar.toString()),
                maxRadius: 30,
              ),
              title: Text(
                "${data[index].firstName} ${data[index].lastName}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Text(data[index].email.toString()),
            );
          },
        ),
      ),
    );
  }
}
