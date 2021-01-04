import 'package:get/get.dart';
import 'package:client/constants/urls.dart';
import 'package:get_storage/get_storage.dart';

class UtilProvider extends GetConnect {
  @override
  void onInit() {

    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = "application/json";
      return request;
    });
  }


  signUp(body) async {
    return await post(BASE_URL + 'signup', body);
  }

  login(body) async {
    final res = await post(BASE_URL + 'login', body);
    final token = res.body['access-token'];

    final box = GetStorage();
    box.write("access-token", token);
  }
}