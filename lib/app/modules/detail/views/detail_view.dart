import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:list_user/app/data/models/detail_user_model.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail User'),
        centerTitle: false,
        elevation: 0,
      ),
      body: controller.obx(
        (state) {
          var dataUser = state as DetailUser;
          return detailWidget(dataUser);
        },
      ),
    );
  }

  Widget detailWidget(DetailUser detail) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        informationWidget(detail).paddingOnly(top: 20),
        const SizedBox(
          height: 20,
        ),
        buttonRow(),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
          child: ListView.builder(
            itemCount: controller.dummyData.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                leading: Icon(
                  controller.dummyData[index]['icon'] as IconData,
                  color: Colors.green,
                ),
                title: Text(
                  controller.dummyData[index]['title'] as String,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Center informationWidget(DetailUser detail) {
    return Center(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(detail.data!.avatar.toString()),
            maxRadius: 80,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${detail.data!.firstName} ${detail.data!.lastName}",
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(detail.data!.email.toString()),
        ],
      ),
    );
  }

  Row buttonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.phone,
            color: Colors.green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.message,
            color: Colors.green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.email,
            color: Colors.green,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.green.shade100,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Icon(
            Icons.share,
            color: Colors.green,
          ),
        ),
      ],
    );
  }
}
