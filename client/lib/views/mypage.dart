import 'package:flutter/material.dart';
import 'package:client/controllers/myPageController.dart';
import 'package:get/get.dart';

class MyPageView extends StatelessWidget {

   final MyPageController _myPageController = Get.put(MyPageController());

  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                icon: Icon(
                    Icons.settings,
                    color: Colors.black,
                ),
                onPressed: () {
                  _myPageController.pushSettingButton();
                },
              )
            ],
          ),
          body: Container(
            padding: EdgeInsets.all(16.0),
              child: Text("마이페이지")

          )
    );
  }
}