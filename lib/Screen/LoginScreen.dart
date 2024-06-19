import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/const/const.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Container(
                  height: w / 2,
                  width: w / 2,
                  // color: Colors.grey,
                  child: Image.asset(
                    'assets/images/image4.png',
                    fit: BoxFit.fitWidth,
                  ),
                ), // replace with your image asset
                SizedBox(height: 30),
                Text(
                  'Log in',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: text_color,
                  ),
                ),
                SizedBox(height: 30),
                CupertinoTextField(
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(CupertinoIcons.phone,
                        color: CupertinoColors.systemGrey),
                  ),
                  placeholder: 'Enter your phone number',
                  keyboardType: TextInputType.phone,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: CupertinoColors.systemGrey4),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                  style: TextStyle(color: text_color),
                ),
                SizedBox(height: 16),
                CupertinoTextField(
                  prefix: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(CupertinoIcons.lock,
                        color: CupertinoColors.systemGrey),
                  ),
                  placeholder: 'Enter your password',
                  obscureText: true,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8.0),
                    border: Border.all(color: CupertinoColors.systemGrey4),
                  ),
                  padding:
                      EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
                  style: TextStyle(color: text_color),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      // Handle forgot password
                    },
                    child:const Text(
                      'Forgot Password?',
                      style: TextStyle(color: primary_color),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  padding:const EdgeInsets.symmetric(horizontal: 140, vertical: 16),
                  color: primary_color,
                  
                  onPressed: () {
                    // Handle login logic
                  },
                  child: const Text('Log in'),
                  
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(color: text_color),
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        // Handle sign up
                      },
                      child: Text(
                        'Sign up',
                        style: TextStyle(color: primary_color),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
