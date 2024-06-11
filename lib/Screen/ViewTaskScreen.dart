import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_emoji_feedback/flutter_emoji_feedback.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/widgets/label.dart';

class ViewTaskScreen extends StatefulWidget {
  const ViewTaskScreen({super.key});

  @override
  State<ViewTaskScreen> createState() => _ViewTaskScreenState();
}

var labels = [
  "Not Started",
  "Starting",
  "In Progress",
  "Almost There",
  "Completed"
];

class _ViewTaskScreenState extends State<ViewTaskScreen> {
  int idx = 0;
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bg_color,
      body: SafeArea(
          child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: h / 6,
            child: Container(
              height: h,
              width: w,
              decoration: BoxDecoration(
                color: secondary_color,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Shadow color with opacity
                    spreadRadius: 0.5, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 3), // Shadow offset (x, y)
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h / 12,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 8, bottom: 8),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 6.0, bottom: 6, left: 16, right: 16),
                        child: Text(
                          " ",
                        ),
                      )),
                  Container(
                    width: w - 32,
                    decoration: BoxDecoration(
                      color: secondary_color,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        // BoxShadow(
                        //   color: Colors.black
                        //       .withOpacity(0.1), // Shadow color with opacity
                        //   spreadRadius: 0.5, // Spread radius
                        //   blurRadius: 10, // Blur radius
                        //   offset: Offset(0, 3), // Shadow offset (x, y)
                        // ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 32.0, right: 32, top: 16),
                          child: EmojiFeedback(
                            animDuration: const Duration(milliseconds: 300),
                            showLabel: false,
                            spaceBetweenItems: 20,
                            curve: Curves.ease,
                            inactiveElementScale: 0.8,
                            onChanged: (value) {
                              setState(() {
                                idx = value - 1;
                              });
                            },
                          ),
                        ),
                        label(
                            fontWeight: FontWeight.normal,
                            text: labels[idx],
                            size: 14),
                      ],
                    ),
                  ),
                  label(
                      fontWeight: FontWeight.bold,
                      text: "Task Headline Task Headline",
                      size: 22)
                ],
              ),
            ),
          ),
          Positioned(
            top: h / 12,
            child: Container(
              height: h / 6,
              width: h / 6,
              decoration: BoxDecoration(
                color: secondary_color,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.1), // Shadow color with opacity
                    spreadRadius: 0.5, // Spread radius
                    blurRadius: 10, // Blur radius
                    offset: Offset(0, 3), // Shadow offset (x, y)
                  ),
                ],
              ),
              child: Image.asset(
                'assets/images/none.png',
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Positioned(
            top: h / 4,
            child: Container(
                margin: EdgeInsets.only(top: 8, bottom: 8),
                decoration: BoxDecoration(
                  color: primary_color.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 6.0, bottom: 6, left: 16, right: 16),
                  child: Text(
                    "Workout",
                    // style:
                    //     TextStyle(fontWeight: FontWeight.bold),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
