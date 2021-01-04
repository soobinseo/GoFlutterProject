import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/providers/utilProvider.dart';
import 'dart:convert';

class LoginController extends GetxController {
  TextEditingController emailController;
  TextEditingController passwordController;
  UtilProvider utilProvider;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    utilProvider = UtilProvider();

    super.onInit();
  }

  void apiLogin() {
    // loading 보여주기 위한 방식
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    var body = jsonEncode({
      "email": emailController.text,
      "password": passwordController.text,
    });

    try {
      utilProvider.login(body);
    } catch(e) {
      print(e.error);
    }


    Get.back();
    Get.offNamed("/testView");


  }

  @override
  void onClose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

}