import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Screen/AddTaskScreen.dart';
import 'package:todo_app/const/const.dart';

class TaskCard extends StatefulWidget {
  String title;
  String discription;
  String time;
  int idx;
  bool imp;
  bool? check;
  String id;
  TaskCard(
      {super.key,
      required this.title,
      required this.discription,
      required this.time,
      required this.idx,
      required this.imp,
      required this.check,
      required this.id});

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(top: 10, left: 5),
          width: w - w / 6,
          height: h / 10,
          decoration: BoxDecoration(
            gradient: gradient(colors[widget.idx]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.all(h / 144),
                    width: w / 8,
                    child: Image.asset(path[widget.idx]),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      label(
                          widget.title.length <= 16
                              ? widget.title
                              : widget.title.substring(0, 13) + "...",
                          30,
                          FontWeight.w400),
                      label(
                          widget.discription.length <= 23
                              ? widget.discription
                              : widget.discription.substring(0, 20) + "...",
                          15,
                          FontWeight.normal),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(right: h / 72),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: h / 70,
                    ),
                    if (widget.imp)
                      Icon(
                        Icons.star,
                        color: Colors.red,
                        size: w / 15,
                        shadows: [
                          BoxShadow(
                            color: Colors.red,
                            blurRadius:
                                30.0, // Increase blur radius for more intensity
                            spreadRadius: 6.0,
                          ),
                        ],
                      )
                    else
                      SizedBox(
                        height: h / 60,
                      ),
                    SizedBox(
                      height: h / 60,
                    ),
                    label(widget.time, 10, FontWeight.normal),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: w / 7,
          child: Center(
            child: Checkbox(
              value: widget.check,
              checkColor: Colors.white,
              fillColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.selected)) {
                  return Colors.green;
                }
                return Colors.grey;
              }),
              onChanged: (val) {
                setState(() {
                  widget.check = val;
                  FirebaseFirestore.instance
                      .collection("Tasks")
                      .doc(widget.id)
                      .update({
                    "check": widget.check,
                  });
                });
              },
            ),
          ),
        )
      ],
    );
  }
}
