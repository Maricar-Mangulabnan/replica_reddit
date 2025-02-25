import 'package:flutter/cupertino.dart';
import 'homepage.dart';
void main (){
  runApp(CupertinoApp(
    theme: CupertinoThemeData(
        brightness: Brightness.light
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();
  bool hidePassword = true;
  String error = "";
  bool isLogin(String username, String password){
    if (username == "admin" && password == "123"){
      setState(() {
        _username.text = "";
        _password.text = "";
        error = "";
      });
      return true;
    }else{
      return false;
    }

  }
