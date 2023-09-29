import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class label extends StatelessWidget {
  String text;
  double size;
  FontWeight fontWeight;
  label({super.key,required this.fontWeight,required this.text,required this.size});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.robotoCondensed(
            textStyle: TextStyle(
                fontSize: size, color: Colors.white, fontWeight: fontWeight)));
    ;
  }
}
