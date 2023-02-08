import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:list_user/app/data/models/users_model.dart';
import 'package:list_user/app/data/providers/users_provider.dart';
import 'package:list_user/app/routes/app_pages.dart';

class HomeController extends GetxController with StateMixin {
  final listUsers = Users().obs;

  @override
  void onInit() {
    super.onInit();
    fetchListUsers();
  }

  void fetchListUsers() async {
    change(null, status: RxStatus.loading());
    try {
      await UsersProvider().fetchListUsers().then((value) {
        listUsers.value = value;
        change(null, status: RxStatus.success());
      });
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    }
  }
}

class search extends SearchDelegate {
  final Users listUsers;
  search(this.listUsers);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final suggestionList = query.isEmpty
        ? listUsers.data
        : listUsers.data
            ?.where((element) => ("${element.firstName} ${element.lastName}")
                .toLowerCase()
                .contains(query))
            .toList();
    return ListView.builder(
      itemCount: suggestionList?.length,
      itemBuilder: (context, index) {
        var data = suggestionList;
        return ListTile(
          onTap: () => Get.toNamed(
            Routes.DETAIL,
            arguments: suggestionList?[index].id,
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(data![index].avatar.toString()),
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = listUsers.data
        ?.where((element) => ("${element.firstName} ${element.lastName}")
            .toLowerCase()
            .contains(query))
        .toList();
    return ListView.builder(
      itemCount: suggestionList?.length,
      itemBuilder: (context, index) {
        var data = suggestionList;
        return ListTile(
          onTap: () => Get.toNamed(
            Routes.DETAIL,
            arguments: suggestionList?[index].id,
          ),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(data![index].avatar.toString()),
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
    );
  }
}
