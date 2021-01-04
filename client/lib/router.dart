import 'package:get/get.dart';
import 'package:client/views/createUser.dart';
import 'package:client/views/login.dart';
import 'package:client/views/test.dart';
import 'package:get_storage/get_storage.dart';

class Routers {

  static final route = [
    GetPage(name: "/", page:() =>
      GetStorage().hasData("access-token") ? TestView() : CreateUserView()
    ),
    GetPage(name: "/testView", page: () => TestView()),
    GetPage(name: "/login", page: () => LoginView()),
  ];
}
