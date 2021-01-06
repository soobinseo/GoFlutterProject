import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:client/controllers/settingController.dart';
import 'package:get/get.dart';

class SettingView extends StatelessWidget {

  final SettingController _settingController = Get.put(SettingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        backgroundColor: Colors.white,
        title: Text("설정"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child:
        Column(
          children: [
            ListView(
              shrinkWrap: true,
              children: [
                InkWellListTile(
                  goto: () {},
                  text: "팔로잉",
                  leadingIcon: Icons.person,
                ),
                InkWellListTile(
                  goto: () {},
                  text: "계정 관리",
                  leadingIcon: Icons.person,
                ),
                InkWellListTile(
                  goto: () {},
                  text: "비밀번호 변경",
                  leadingIcon: Icons.person,
                ),
                InkWellListTile(
                  goto: () {},
                  text: "알림",
                  leadingIcon: Icons.person,
                ),
                InkWellListTile(
                  goto: () {},
                  text: "고객센터",
                  leadingIcon: Icons.person,
                )

              ],
            ),
            SizedBox(height: 50),
            Center(
              child:
              Text("version 0.0.1",
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Center(
                child: RichText(

                    text: TextSpan(
                        text: "로그아웃",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.grey,
                            fontSize: 16.0),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _settingController.logout();
                          }
                    )
                )
            )
          ],
        )



      )
    );
  }
}

class InkWellListTile extends StatelessWidget {

  final goto;
  final String text;
  final IconData leadingIcon;

  const InkWellListTile({Key key, @required this.goto, @required this.text, @required this.leadingIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => goto(),
        child: ListTile(
          leading: Icon(leadingIcon),
          title: Text(text),
          trailing: Icon(Icons.navigate_next),
        )
    );
  }
}

