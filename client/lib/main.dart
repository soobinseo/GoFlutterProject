import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/router.dart';
import 'package:get_storage/get_storage.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initServices();

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
