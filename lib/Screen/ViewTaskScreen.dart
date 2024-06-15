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
  final _formKey = GlobalKey<FormState>();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
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
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  children: [
                    SizedBox(
                      height: h / 12,
                    ),
                    Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 6.0, bottom: 6),
                          child: Text(
                            " ",
                          ),
                        )),
                    Container(
                      // width: w - 32,
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
                                left: 16.0, right: 16, top: 16),
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
                        size: 22),
                    Container(
                        decoration: BoxDecoration(
                          color: primary_color.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(20),
                          
                          boxShadow: [
                            // BoxShadow(
                            //   color: Colors.black.withOpacity(
                            //       0.1), // Shadow color with opacity
                            //   spreadRadius: 0.5, // Spread radius
                            //   blurRadius: 10, // Blur radius
                            //   offset: Offset(0, 3), // Shadow offset (x, y)
                            // ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            "ask Headline Task Headlineask Headline Task Headline ask Headline Task Headline ask Headline Task Headline",
                            style: TextStyle(color: text_color, fontSize: 18),
                          ),
                        ))
                  ],
                ),
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
          Positioned(
              top: 8,
              left: 16,
              child: IconButton.filled(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(secondary_color),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: primary_color,
                  ))),
          Positioned(
              top: 8,
              right: 16,
              child: IconButton.filled(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(secondary_color),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit Information'),
                          content: Form(
                            key: _formKey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                TextFormField(
                                  controller: _nameController,
                                  decoration:
                                      InputDecoration(labelText: 'Name'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your name';
                                    }
                                    return null;
                                  },
                                ),
                                TextFormField(
                                  controller: _emailController,
                                  decoration:
                                      InputDecoration(labelText: 'Email'),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter your email';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  Navigator.of(context).pop();
                                }
                              },
                              child: Text('Save'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: primary_color,
                  )))
        ],
      )),
    );
  }
}
