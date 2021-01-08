import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/providers/utilProvider.dart';
import 'dart:convert';
import 'package:client/views/home.dart';

class LoginController extends GetxController {
  TextEditingController emailController;
  TextEditingController passwordController;
  UtilProvider utilProvider;
  RxBool isValid = false.obs;

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    utilProvider = UtilProvider();

    super.onInit();
  }

  void validUpdate() {
    isValid.value = emailController.text.isNotEmpty && passwordController.text.isNotEmpty;
  }

  void apiLogin() async {
    // loading 보여주기 위한 방식
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);
    var body = jsonEncode({
      "email": emailController.text,
      "password": passwordController.text,
    });

    await utilProvider.login(body);


  }

  void validCheck() {

  }

  @override
  void onClose() {
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

}