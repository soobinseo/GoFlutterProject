import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/providers/utilProvider.dart';
import 'dart:convert';
import 'package:client/views/home.dart';

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

  void apiLogin() async {
    // loading 보여주기 위한 방식
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    var body = jsonEncode({
      "email": emailController.text,
      "password": passwordController.text,
    });

    print(body);

    try {
      Response res = await utilProvider.login(body);
      if (res.statusCode == 200) {
        Get.back();
        Get.offNamed('/home');
      } else {
//        // TODO:
        Get.offNamed('/login');
      }

    } catch(e) {
      print(e.error);
    }




  }

  @override
  void onClose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

}