import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/providers/utilProvider.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class SettingController extends GetxController {

  UtilProvider utilProvider;

  @override
  void onInit() {

    utilProvider = UtilProvider();
    super.onInit();
  }

  logout() {
    final box = GetStorage();
    box.remove("access-token");
    // TODO: access token 파기 api 구현
    Get.back();
    Get.offNamed("/login");
  }


  @override
  void onClose() {
    super.onClose();
  }

}