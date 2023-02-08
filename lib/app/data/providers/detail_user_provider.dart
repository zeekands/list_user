import 'package:get/get.dart';
import 'package:list_user/app/constants/constants.dart';

import '../models/detail_user_model.dart';

class DetailUserProvider extends GetConnect {
  Future<DetailUser> fetchDetailUser(String id) async {
    final response = await get('$BASE_URL/users/$id');
    if (response.status.hasError) {
      return Future.error(response.statusText.toString());
    } else {
      return DetailUser.fromJson(response.body);
    }
  }
}
