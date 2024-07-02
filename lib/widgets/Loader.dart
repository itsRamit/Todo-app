import 'package:flutter/material.dart';
import 'package:jumping_dot/jumping_dot.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: JumpingDots(
        color: Colors.white,
        radius: 7,
        numberOfDots: 3,
        verticalOffset: -5,
        animationDuration: Duration(milliseconds: 200),
      ),
    );
  }
}
