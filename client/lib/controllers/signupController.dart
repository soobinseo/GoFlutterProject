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

  void signUp() async {
    // loading 보여주기 위한 방식
    Get.dialog(Center(child: CircularProgressIndicator()),
        barrierDismissible: false);

    var body = jsonEncode({
      "userDetail": {"name": nameController.text},
      "email": emailController.text,
      "password": passwordController.text,
    });

    try {
      Response res = await utilProvider.signUp(body);
      if (res.statusCode == 200) {
        Response res_login = await utilProvider.login(body);
        Get.back();
        Get.offNamed("/home");
      } else if (res.statusCode == 419){
        //TODO: 중복된 사용자 토글
      } else {
        // TODO: 서버에러 토글
      }

    } catch(e){
      //toggle error
      print(e.error);
    }



  }

  @override
  void onClose() {
    nameController?.dispose();
    emailController?.dispose();
    passwordController?.dispose();
    super.onClose();
  }

}