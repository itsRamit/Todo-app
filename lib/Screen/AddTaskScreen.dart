import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Screen/TaskScreen.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/widgets/button.dart';

class Addtask extends StatefulWidget {
  const Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  int idx = 5;
  bool imp = false;
  TextEditingController _title = TextEditingController();
  TextEditingController _description = TextEditingController();

  Widget build(BuildContext context) {
    List<Widget> buttons = List.generate(category.length, (index) {
      return Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              idx = index;
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: colors[index],
            foregroundColor: Colors.white,
          ),
          child: Text(category[index]),
        ),
      );
    });
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff030404),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h / 30,
              ),
              label("Create", 40, FontWeight.bold),
              label("New Task", 40, FontWeight.bold),
              SizedBox(
                height: h / 30,
              ),
              label("Task title", 20, FontWeight.normal),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: w - w / 30,
                  height: h / 13,
                  decoration: BoxDecoration(
                      gradient: gradient(colors[idx]),
                      color: Color(0xff616B7B),
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: TextFormField(
                      controller: _title,
                      style: GoogleFonts.robotoCondensed(
                          color: Colors.white, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                          suffixIcon: imp
                              ? Icon(
                                  Icons.star_outline_outlined,
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
                              : null,
                          border: InputBorder.none,
                          hintText: "Add title",
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.only(left: 20, top: 10)),
                      cursorColor: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: h / 30,
              ),
              label("Description", 20, FontWeight.normal),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Container(
                  width: w - w / 30,
                  height: h / 5,
                  decoration: BoxDecoration(
                      // color: Color(0xff616B7B),
                      gradient: gradient(colors[idx]),
                      borderRadius: BorderRadius.circular(20)),
                  child: TextFormField(
                    maxLines: 10,
                    controller: _description,
                    style: GoogleFonts.robotoCondensed(color: Colors.white),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: "Add title",
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.only(left: 20, top: 8)),
                    cursorColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: h / 30,
              ),
              ElevatedButton(
                onPressed: () {
                  if (!imp)
                    imp = true;
                  else
                    imp = false;
                  setState(() {});
                },
                child: Text(
                  "Important",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
              ),
              SizedBox(
                height: h / 30,
              ),
              label("Category", 20, FontWeight.normal),
              Wrap(
                children: buttons,
              ),
              SizedBox(
                height: h / 30,
              ),
              Button(
                  onPressed: () {
                    FirebaseFirestore.instance.collection("Tasks").add({
                      "title": _title.text.toString(),
                      "description": _description.text.toString(),
                      "category": idx,
                      "important": imp,
                      "check": false,
                      "time":
                          "${DateTime.now().hour}:${DateTime.now().minute} ${DateTime.now().hour <= 12 ? "AM" : "PM"}"
                    });
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  },
                  title: "Add Task",
                  loading: false)
            ],
          ),
        ),
      ),
    );
  }
}

Widget label(String text, double size, FontWeight fontWeight) {
  return Text(text,
      style: GoogleFonts.robotoCondensed(
          textStyle: TextStyle(
              fontSize: size, color: Colors.white, fontWeight: fontWeight)));
}
