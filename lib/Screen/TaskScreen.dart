import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/Screen/ViewTaskScreen.dart';
import 'package:todo_app/widgets/TaskCard.dart';

class taskscreen extends StatefulWidget {
  const taskscreen({super.key});

  @override
  State<taskscreen> createState() => _taskscreenState();
}

class _taskscreenState extends State<taskscreen> {
  late Stream<QuerySnapshot> _stream;

  @override
  void initState() {
    super.initState();
    _stream = FirebaseFirestore.instance.collection("Tasks").snapshots();
  }

  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xff030404),
      appBar: AppBar(
        backgroundColor: Color(0xff616B7B),
        title: Title(
            color: Colors.green,
            child: Text(
              "Tasks",
              style: GoogleFonts.robotoCondensed(color: Colors.black),
            )),
      ),
      body: StreamBuilder(
        stream: _stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> document =
                    snapshot.data!.docs[index].data() as Map<String, dynamic>;
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ViewTaskScreen(
                                Document: document,
                                id: snapshot.data!.docs[index].id)));
                  },
                  child: TaskCard(
                    title: document["title"],
                    discription: document["description"],
                    idx: document["category"],
                    imp: document["important"],
                    time: document["time"],
                    check: document["check"],
                    id: snapshot.data!.docs[index].id,
                  ),
                );
              });
        },
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
