import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/providers/utilProvider.dart';
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:client/models/users.dart';


class UserDetailController extends GetxController {

  var isLoading = true.obs;
  UtilProvider utilProvider;
  Rx<UserDetail> user = UserDetail().obs;

  var name = Get.arguments;
  final bool isFirst;

  UserDetailController(this.isFirst);

  @override
  void onInit() {

    utilProvider = UtilProvider();
//    initUser();
//    if (isFirst) {
//        name = Get.arguments;
//        user.update((val) { val.name = name;});
//    } else {
//      fetchData();
//    }

    fetchData();
    super.onInit();
  }

  fetchData() async {

    try {
      isLoading(true);
      final jsonResult = await utilProvider.getUserDetail();
      var userDetails = UserDetail.fromJson(jsonResult);
      if (userDetails != null) {
        user.value = userDetails;
        user.refresh();
      }

    } finally {
      isLoading(false);
    }

    if (user.value.careers == null) {
      user.value.careers = new List<Career>();
      user.value.careers.add(new Career(userDetailId: user.value.userId));
    }

    if (user.value.educations == null) {
      user.value.educations = new List<Education>();
      user.value.educations.add(new Education(userDetailId: user.value.userId));
    }
  }

  deleteCareer(value) {
    user.value.careers.remove(value);
    user.refresh();
  }

  addCareer() {
    user.value.careers.add(new Career(userDetailId: user.value.userId));
    user.refresh();
  }

  addEducation() {
    user.value.educations.add(new Education(userDetailId: user.value.userId));
    user.refresh();
  }

  saveData() async {
    String body = jsonEncode(user.toJson());
    print(body);
    utilProvider.createUserDetail(body);

    Get.offNamed("/home");
  }



  @override
  void onClose() {
    super.onClose();
  }

}
