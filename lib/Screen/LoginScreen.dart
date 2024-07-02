import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/service/UserService.dart';
import 'package:todo_app/widgets/Loader.dart';
import 'package:todo_app/widgets/utils.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passController = TextEditingController();
  bool loading = false;
  void check(String email, String pass) async {
    setState(() {
      loading = true;
    });
    var response = await UserService().userlogin(email, pass);
    if (response.statusCode == 200) {
      Utils().toastmessage("Success");
    } else {
      Utils().toastmessage("Invalid username or password");
    }
    setState(() {
      loading = false;
    });
  }

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
                const Text(
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
                    child: Icon(CupertinoIcons.mail,
                        color: CupertinoColors.systemGrey),
                  ),
                  controller: emailController,
                  placeholder: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
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
                  controller: passController,
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
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: primary_color),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                CupertinoButton(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 140, vertical: 16),
                  color: primary_color,
                  onPressed: () {
                    if (emailController.text.isEmpty ||
                        passController.text.isEmpty) {
                      Utils().toastmessage("Fill the required fields first!");
                    } else {
                      check(emailController.text, passController.text);
                    }
                  },
                  child: loading ? Loader() : const Text('Log in'),
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
