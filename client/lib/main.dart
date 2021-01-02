import 'package:flutter/material.dart';
import 'package:client/mainpage.dart';
import 'package:flutter/gestures.dart';

Future<void> main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        resizeToAvoidBottomPadding: false,
    body:
        Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 75.0),
        child: Center(
          child: Text(
            "가입하고 커리어리를\n"
                " 무료로 이용하세요.",
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),

      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 50.0,
          width: 350.0,
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
                                  style: TextStyle(decoration: TextDecoration.underline, color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0),
                                  recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                    login();
                              })
                            ]
                        ),
                      )
                  )
        ),
        ),
      ),




      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black26),
              borderRadius: BorderRadius.circular(7.0)),
          child: TextField(
            controller: name,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(10.0),
                labelText: "이름 입력",
                labelStyle: TextStyle(fontSize: 15.0)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black26),
              borderRadius: BorderRadius.circular(7.0)),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(10.0),
                labelText: "이메일 입력",
                labelStyle: TextStyle(fontSize: 15.0)),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(width: 1.0, color: Colors.black26),
              borderRadius: BorderRadius.circular(7.0)),
          child: TextField(
            controller: password,
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(10.0),
                labelText: "패스워드 입력",
                labelStyle: TextStyle(fontSize: 15.0)),
          ),
        ),
      ),

      GestureDetector(
          onTap: () {
            if (name.text == null || name.text.length == 0){
              return;
            }
            Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));
          },


          child: Container(
            width: 300.0,
            height: 50.0,
            child: Center(
                child: Text(
                  "가입하기",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15.0, fontWeight: FontWeight.bold),
                )),
            decoration: BoxDecoration(
                color: Colors.redAccent, borderRadius: BorderRadius.circular(7.0)),
          ))
    ])
    );
  }

  Scaffold buildLoginPage() {
      return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 240.0),
            child: Column(
              children: <Widget>[
                Text(
                  'Fluttergram',
                  style: TextStyle(
                      fontSize: 60.0,
                      fontFamily: "Billabong",
                      color: Colors.black),
                ),
                Padding(padding: const EdgeInsets.only(bottom: 100.0)),
                RaisedButton(onPressed: login, child: Text("login"),)
              ],
            ),
          ),
        ),
      );
    }

    void login() {
      debugPrint("aa");
    }
}
