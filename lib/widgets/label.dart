import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Assume text_color is defined somewhere in your const file.
import 'package:todo_app/const/const.dart';

class label extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;

  label({
    super.key,
    required this.fontWeight,
    required this.text,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 8.0),
      child: Text(
        text,
        style: GoogleFonts.interTight(
          fontSize: size,
          color: CupertinoColors.black, // Adjust the color to your preference
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
