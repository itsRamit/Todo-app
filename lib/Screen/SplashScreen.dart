import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/screen/LoginScreen.dart';
import 'package:todo_app/screen/OnboardingScreen.dart';
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (context) => OnboardingScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              primary_color,
              primary_color.withOpacity(0.8),
              primary_color.withOpacity(0.6),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
            child: Container(
          height: w / 2,
          width: w / 2,
          child: Image.asset('assets/images/logo.png'),
        )),
      ),
    );
  }
}
