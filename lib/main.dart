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

    @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        middle: Text(
          'Reddit',
          style: TextStyle(
            color: CupertinoColors.systemRed,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              SizedBox(height: 170),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sign in',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: CupertinoColors.darkBackgroundGray,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ],
              ),
              
              
