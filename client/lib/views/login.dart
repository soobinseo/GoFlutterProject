import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:get/get.dart';
import 'package:client/controllers/loginController.dart';

class LoginView extends StatelessWidget {

  final LoginController _loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body:
        Container(
            padding: EdgeInsets.all(16),
            child:
            Form(
                key: _formKey,
                child:
                Column(children: <Widget>[

                  SizedBox(height: 75.0),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black26),
                        borderRadius: BorderRadius.circular(7.0)),
                    child: TextFormField(
                      controller: _loginController.emailController,
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
                      controller: _loginController.passwordController,
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
                        '로그인',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _loginController.apiLogin();
                        }
                      })


                ])
            )
        )
    );
  }
}