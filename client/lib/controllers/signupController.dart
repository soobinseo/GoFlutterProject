import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/providers/utilProvider.dart';
import 'dart:convert';

class SignUpController extends GetxController {
  TextEditingController nameController;
  TextEditingController emailController;
  TextEditingController passwordController;
  UtilProvider utilProvider;

  @override
  void onInit() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    utilProvider = UtilProvider();
    super.onInit();
  }

  void signUp() {
    // loading 보여주기 위한 방식
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    var body = jsonEncode({
      "name": nameController.text,
      "email": emailController.text,
      "password": passwordController.text,
    });

    try {
      utilProvider.signUp(body);
    } catch(e){
      //toggle error
      print(e.error);
    }

    Get.back();
    Get.offNamed("/login");

  }

  @override
  void onClose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

}