import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:client/controllers/signupController.dart';

class CreateUserView extends StatelessWidget {
   final SignUpController _signUpController = Get.put(SignUpController());
   final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            SingleChildScrollView(
              padding: EdgeInsets.all(16),
                  child:
                  Form(
                      key: _formKey,
                      child:
                      Column(children: <Widget>[

                        SizedBox(height: 75.0),
                        Center(
                          child: Text(
                            "가입하고 커리어리를\n"
                                " 무료로 이용하세요.",
                            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                          ),
                        ),

                        SizedBox(height: 16.0),
                        Container(
                          height: 50.0,
                          width: Get.width,
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: Colors.grey[200]),
                              borderRadius: BorderRadius.circular(7.0),
                              color: Colors.grey[200]),
                          child: Container(
                              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                              child: Center(child: RichText(
                                text: TextSpan(
                                    children: [
                                      TextSpan(text: "앗! 이미 회원이신가요?  ",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0
                                          )
                                      ),
                                      TextSpan(
                                          text: "로그인하기",
                                          style: TextStyle(
                                              decoration: TextDecoration.underline,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              Get.offNamed("/login");
                                            })
                                    ]
                                ),
                              )
                              )
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: Colors.black26),
                              borderRadius: BorderRadius.circular(7.0)),
                          child: TextFormField(
                            controller: _signUpController.nameController,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10.0),
                                labelText: "이름 입력",
                                labelStyle: TextStyle(fontSize: 15.0)),
                            validator: (value) => value.trim().isEmpty? "이름을 입력하세요" : null,),
                        ),

                        SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: Colors.black26),
                              borderRadius: BorderRadius.circular(7.0)),
                          child: TextFormField(
                            controller: _signUpController.emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10.0),
                                labelText: "이메일 입력",
                                labelStyle: TextStyle(fontSize: 15.0)),
                            validator: (value) => value.trim().isEmpty? "이메일을 입력하세요" : null,
                          ),
                        ),

                        SizedBox(height: 16.0),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(width: 1.0, color: Colors.black26),
                              borderRadius: BorderRadius.circular(7.0)),
                          child: TextFormField(
                            controller: _signUpController.passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.all(10.0),
                                labelText: "패스워드 입력",
                                labelStyle: TextStyle(fontSize: 15.0)),
                            validator: (value) => value.trim().isEmpty? "비밀번호를 입력하세요" : null,
                          ),
                        ),

                        SizedBox(height: 16.0),
                        MaterialButton(
                            color: Colors.deepOrangeAccent,
//              splashColor: Colors.white,
                            height: 50,
                            minWidth: Get.width,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '가입하기',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                _signUpController.signUp();
                              }
                            })


                      ])
                  )

            )

    );
  }
}