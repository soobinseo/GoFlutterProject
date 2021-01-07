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
                Column(
                    children: <Widget>[

                  SizedBox(height: 50.0),

                  Container(
                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only( top: 10, bottom: 10),
                    child: Text("이메일", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14
                    ),),
                  ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black26),
                        borderRadius: BorderRadius.circular(7.0)),
                    child: TextFormField(
                      controller: _loginController.emailController,
                      onChanged: (_) => _loginController.validUpdate(),
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
                        alignment: Alignment.topLeft,
                        padding: EdgeInsets.only( top: 10, bottom: 10),
                        child: Text("비밀번호", style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14
                        ),),
                      ),

                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1.0, color: Colors.black26),
                        borderRadius: BorderRadius.circular(7.0)),
                    child: TextFormField(
                      controller: _loginController.passwordController,
                      onChanged: (_) => _loginController.validUpdate(),
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

                  Obx(() {
                    return MaterialButton(

                        color: _loginController.isValid.value ? Colors.deepOrangeAccent : Colors.transparent,
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
                        onPressed: () =>
                        (_formKey.currentState.validate())
                            ? _loginController.apiLogin()
                            : null

                    );
                  })




                ])
            )
        )
    );
  }
}