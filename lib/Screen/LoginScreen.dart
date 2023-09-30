import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/widgets/button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late Auth0 _auth0;
  Credentials? _credentials;

  void initState() {
    super.initState();
    _auth0 = Auth0('dev-bfs2x5fxxerenzoy.us.auth0.com',
        'cV1dyLWx61fL5jHDJLL0Ml4dsjNaCC0M');
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;

    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: h / 3,
          ),
          Container(
              width: w,
              height: 2 * h / 3,
              decoration: BoxDecoration(
                color: Color(0xffffa500),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h / 2,
                  ),
                  if (_credentials == null)
                    Button(
                        onPressed: () async {
                          // final credentials = await _auth0
                          //     .webAuthentication(scheme: "https")
                          //     .login();

                          // setState(() {
                          //   _credentials = credentials;
                          // });
                        },
                        title: "Get Started",
                        color:Colors.green,
                        loading: false),
                ],
              )),
        ],
      ),
    ));
  }
}
