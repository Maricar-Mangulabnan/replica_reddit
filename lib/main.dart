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

              SizedBox(height: 60),
              CupertinoTextField(
                controller: _username,
                placeholder: "Email or Username",
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              SizedBox(height: 10),
              CupertinoTextField(
                controller: _password,
                placeholder: "Password",
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                  borderRadius: BorderRadius.circular(15),
                ),
                obscureText: hidePassword,
                suffix: CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: Icon(
                    hidePassword ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    size: 20,
                    color: CupertinoColors.systemRed,
                  ),
                  onPressed: () {
                    setState(() {
                      hidePassword = !hidePassword;
                    });
                  },
                ),
              ),

                SizedBox(height: 10),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Forgot Password?",
                  style: TextStyle(
                    color: CupertinoColors.systemRed,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemRed,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: CupertinoButton(
                  child: Text(
                    'Continue',
                    style: TextStyle(color: CupertinoColors.white),
                  ),
                  onPressed: () {
                    isLogin(_username.text, _password.text)
                        ? Navigator.pushReplacement(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => Homepage()))
                        : setState(() {
                      _password.text = "";
                      error = "Incorrect Username or Password";
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
              Text(
                error,
                style: TextStyle(
                  color: CupertinoColors.destructiveRed,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

//

              
              
