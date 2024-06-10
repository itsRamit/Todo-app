import 'package:flutter/material.dart';

const primary_color = Color(0xFF68E5A1);
const bg_color = Color(0xFFF5F5F5);
const secondary_color = Color(0xFFFEFEFE);
const text_color = Color.fromARGB(255, 51, 67, 75);

LinearGradient gradient(Color _color) {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      stops: [
        0.0,
        1.0
      ],
      colors: [
        _color,
        Color(0xff616B7B),
      ]);
}

final List<Color> colors = [
  Colors.orange,
  Colors.green,
  Colors.blue,
  Colors.yellow,
  Colors.pink,
  Color(0xff616B7B)
];
final List<String> category = [
  "Food",
  "Workout",
  "Work",
  "Timer",
  "Study",
  "None"
];
final List<String> path = [
  "assets/images/food.png",
  "assets/images/workout.png",
  "assets/images/work.png",
  "assets/images/clock.png",
  "assets/images/study.png",
  "assets/images/none.png",
];
