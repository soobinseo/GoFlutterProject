import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:client/controllers/userDetailController.dart';

class UserDetailView extends StatelessWidget {
  final UserDetailController _userDetailController =
      Get.put(UserDetailController(true));
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text(
            "프로필 편집",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            MaterialButton(
                padding: EdgeInsets.all(10),
                color: Colors.deepOrangeAccent,
//              splashColor: Colors.white,
                height: 10,
                minWidth: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  '저장',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _userDetailController.saveData();
                  }
                })
          ],
        ),
        body: SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Obx(() {

              return _userDetailController.isLoading.value? Center(child: CircularProgressIndicator(),): Form(
                  key: _formKey,
                  child: Column(children: <Widget>[
                    SizedBox(height: 16.0),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "이름",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.black26),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: TextFormField(
                        initialValue: _userDetailController.user.value.name,
                        onChanged: (value) =>
                            _userDetailController.user.update((val) {
                          val.name = value;
                        }),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(10.0),
                            labelText: "이름 입력",
                            labelStyle: TextStyle(fontSize: 14.0)),
                        validator: (value) =>
                            value.trim().isEmpty ? "이름을 입력하세요" : null,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "직함",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.black26),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: TextFormField(
                        initialValue: _userDetailController.user.value.title,
                        onChanged: (value) =>
                            _userDetailController.user.update((val) {
                          val.title = value;
                        }),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(10.0),
                            labelText: "직함 입력",
                            labelStyle: TextStyle(fontSize: 14.0)),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Text(
                        "자기소개",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14),
                      ),
                    ),
                    Container(
                      height: 90,
                      decoration: BoxDecoration(
                          border: Border.all(width: 1.0, color: Colors.black26),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: TextFormField(
                        initialValue:
                            _userDetailController.user.value.introduce,
                        onChanged: (value) =>
                            _userDetailController.user.update((val) {
                          val.introduce = value;
                        }),
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.all(10.0),
                            labelText: "본인을 소개해보세요",
                            labelStyle: TextStyle(fontSize: 14.0)),
                      ),
                    ),
                    Column(children: <Widget>[
                      ..._userDetailController.user.value.careers.map((item) {
                        return Column(
                          children: [
                            SizedBox(height: 16.0),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "회사",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                  RichText(
                                      text: TextSpan(
                                          text: "학력 제거하기",
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14.0),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              _userDetailController
                                                  .deleteCareer(item);
                                            })),
                                ]),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black26),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: TextFormField(
                                initialValue: item.company,
                                onChanged: (value) {
                                  item.company = value;
                                  _userDetailController.user.refresh();
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(10.0),
                                    labelText: "회사 입력",
                                    labelStyle: TextStyle(fontSize: 14.0)),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "직함",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black26),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: TextFormField(
                                initialValue: item.title,
                                onChanged: (value) {
                                  item.title = value;
                                  _userDetailController.user.refresh();
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(10.0),
                                    labelText: "직함 입력",
                                    labelStyle: TextStyle(fontSize: 14.0)),
                              ),
                            ),
                          ],
                        );
                      })
                    ]),
                    Container(
                        alignment: Alignment.topLeft,
                        child: RichText(
                            text: TextSpan(
                                text: "+ 경력 추가하기",
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    _userDetailController.addCareer();
                                  }))),
                    Column(children: <Widget>[
                      ..._userDetailController.user.value.educations
                          .map((item) {
                        return Column(
                          children: [
                            SizedBox(height: 14.0),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "학교",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black26),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: TextFormField(
                                initialValue: item.university,
                                onChanged: (value) {
                                  item.university = value;
                                  _userDetailController.user.refresh();
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(10.0),
                                    labelText: "학교 입력",
                                    labelStyle: TextStyle(fontSize: 14.0)),
                              ),
                            ),
                            SizedBox(height: 16.0),
                            Container(
                              alignment: Alignment.topLeft,
                              padding: EdgeInsets.only(top: 10, bottom: 10),
                              child: Text(
                                "전공",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1.0, color: Colors.black26),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: TextFormField(
                                initialValue: item.major,
                                onChanged: (value) {
                                  item.major = value;
                                  _userDetailController.user.refresh();
                                },
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    contentPadding: const EdgeInsets.all(10.0),
                                    labelText: "전공 입력",
                                    labelStyle: TextStyle(fontSize: 14.0)),
                              ),
                            ),
                          ],
                        );
                      })
                    ]),
                    RichText(
                        text: TextSpan(
                            text: "+ 학력 추가하기",
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 14.0),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                _userDetailController.addEducation();
                              })),
                  ]));
            })));
  }
}
