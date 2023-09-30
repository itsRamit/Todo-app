import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  VoidCallback onPressed;
  bool loading;
  Color color;
  String title;
  Button({
    super.key,
    required this.onPressed,
    required this.title,
    required this.loading,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 175,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          child: !loading
              ? Text(
                  title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              : CircularProgressIndicator(
                  color: Colors.white,
                )),
    );
  }
}
