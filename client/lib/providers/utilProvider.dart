import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:client/constants/urls.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sprintf/sprintf.dart';
import 'dart:convert';

const ACCESS_TOKEN = "accessToken";

class UtilProvider extends GetConnect {

  final storage = GetStorage();

  @override
  void onInit() {

    httpClient.addRequestModifier((request) {
      request.headers['Content-Type'] = "application/json";

      return request;
    });

  }

  signUp(body) async {
    try {
      final res = await post(BASE_URL + 'signup', body);
      return res;
    } on Exception {
      throw Error();
    }
  }

  getUserDetail() async {

    var headers = Map<String, String>();
    final accessToken = storage.read(ACCESS_TOKEN);
    print("here!!");
    print(accessToken);
    if (accessToken != null) {
      headers['Authorization'] = "Bearer $accessToken";
    }
    final res = await get(BASE_URL + 'api/userDetail', headers: headers);

    print(res.body);
    // TODO: error handling
//    switch (res.statusCode) {
//
//    }
    Map<String, dynamic> jsonResult = res.body;
    return jsonResult;
  }

  login(body) async {
    final res = await post(BASE_URL + 'login', body);

    //TODO: expired token 처리
    switch (res.statusCode) {
      case 200:
        storage.write(ACCESS_TOKEN, res.body['access-token']);
        Get.back();
        Get.offNamed('/home');
        break;
      case 401:

//        showDialog(
//          context: Get.overlayContext,
//          barrierDismissible: false,
//          builder: (context) {
//            Future.delayed(Duration(seconds: 1), () {Navigator.of(context).pop(true);});
//            return AlertDialog(
//          title: Text(""),
//          content: Text("이메일과 아이디를 확인하세요"),
//        );
//        },
//        );
        Get.back();
        Get.dialog(
          AlertDialog(
            title: Text(""),
            content: Text("이메일과 아이디를 확인하세요"),
          )
          ,);
        await Future.delayed(Duration(seconds: 1));
        Get.back();
        break;
      default:
        Get.back();
        Get.dialog(
          // TODO: 꾸미기
          AlertDialog(
            title: Text(""),
            content: Text("서버에 문제가 생겼습니다."),
          )
          ,);
        await Future.delayed(Duration(seconds: 1));
        Get.back();
    }

    return res;
  }

  createUserDetail(body) async {

    try {
      var headers = Map<String, String>();
      final accessToken = storage.read(ACCESS_TOKEN);
      print("here!!");
      print(accessToken);
      if (accessToken != null) {
        headers['Authorization'] = "Bearer $accessToken";
      }
      final res = await post(BASE_URL + 'api/createUserDetail', body, headers: headers);
      return res;
    } on Exception {
      throw Error();
    }


}

  fetchData() async {
    final res = get(BASE_URL + "api/user_detail");
  }


}