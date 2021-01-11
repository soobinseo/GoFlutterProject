import 'package:get/get.dart';
import 'package:client/views/createUser.dart';
import 'package:client/views/login.dart';
import 'package:client/views/home.dart';
import 'package:client/views/setting.dart';
import 'package:get_storage/get_storage.dart';
import 'package:client/views/userDetail.dart';


class Routers {

  static final route = [
    GetPage(name: "/", page:() =>
      GetStorage().hasData("access-token") ? HomeView() : CreateUserView()
    ),
    GetPage(name: "/login", page: () => LoginView()),
    GetPage(name: "/setting", page: () => SettingView()),
    GetPage(name: "/home", page: () => HomeView()),
    GetPage(name: "/userDetail", page: () => UserDetailView()),
  ];
}