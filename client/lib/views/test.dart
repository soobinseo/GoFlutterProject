import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class TestView extends StatelessWidget {

  // final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
          Container(
                padding: EdgeInsets.all(16.0),
                width: 300.0,
                height: Get.width,
                child: Center(
                    child: Text(
                      "여기",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold),
                    )),
          )
    );

  }
}