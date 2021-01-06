import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';

class CuratorView extends StatelessWidget {

  // final SignupController _signupController = Get.put(SignupController());

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.grey,
        title: Text("curator"),
      ),
      body: Center(child: Text("큐레이터"),),
    );
  }

}