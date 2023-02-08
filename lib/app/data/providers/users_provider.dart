import 'package:get/get.dart';
import 'package:list_user/app/constants/constants.dart';

import '../models/users_model.dart';

class UsersProvider extends GetConnect {
  Future<Users> fetchListUsers() async {
    final response = await get('$BASE_URL/users');
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return Users.fromJson(response.body);
    }
  }
}
