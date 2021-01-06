import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/providers/utilProvider.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';

class MyPageController extends GetxController {

  UtilProvider utilProvider;

  @override
  void onInit() {

    utilProvider = UtilProvider();
    super.onInit();
  }

  pushSettingButton() {
    Get.toNamed("/setting");
  }

  @override
  void onClose() {
    super.onClose();
  }

}