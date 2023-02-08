import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:list_user/app/data/providers/detail_user_provider.dart';

class DetailController extends GetxController with StateMixin {
  final id = Get.arguments.toString();
  final dummyData = [
    {
      "icon": Icons.home,
      "title": "Home",
    },
    {
      "icon": Icons.location_on,
      "title": "Address",
    },
    {
      "icon": Icons.task,
      "title": "Task",
    },
    {
      "icon": Icons.help,
      "title": "Help",
    },
    {
      "icon": Icons.check,
      "title": "Hire",
    },
  ];
  @override
  void onInit() {
    super.onInit();
    fetchListUsers(id);
  }

  void fetchListUsers(String id) async {
    change(null, status: RxStatus.loading());
    try {
      await DetailUserProvider().fetchDetailUser(id).then((value) {
        change(value, status: RxStatus.success());
      });
    } catch (e) {
      change(value, status: RxStatus.error(e.toString()));
    }
  }
}
