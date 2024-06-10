import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/const/const.dart';

class label extends StatelessWidget {
  String text;
  double size;
  FontWeight fontWeight;
  label(
      {super.key,
      required this.fontWeight,
      required this.text,
      required this.size});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8.0),
      child: Text(text,
          style: TextStyle(
              fontSize: size, color: text_color, fontWeight: fontWeight)),
    );
    ;
  }
}
