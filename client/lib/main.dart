import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/router.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();

  FlutterError.onError = (FlutterErrorDetails details) {
    print("Error From INSIDE FRAME_WORK");
    print("----------------------");
    print("Error :  ${details.exception}");
    print("StackTrace :  ${details.stack}");
  };

  runApp(
      GetMaterialApp(
        title: "CloneApp",
        debugShowCheckedModeBanner: false,
        getPages: Routers.route,
        initialRoute: "/",
      )
  );
}

void initServices() async {
  await GetStorage.init();
}
