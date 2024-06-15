import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/screen/AddTaskScreen.dart';
import 'package:todo_app/screen/ProfileScreen.dart';
import 'package:todo_app/screen/TaskScreen.dart';
import 'package:todo_app/screen/ViewTaskScreen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

List<Widget> screens = [TaskScreen(), AddTaskScreen(), ProfileScreen()];

class _HomeState extends State<Home> {
  int currentidx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        onTap: (int index) {
          setState(() {
            currentidx = index;
          });
        },
        height: 60,
        backgroundColor: bg_color, //image.assets("Path")
        color: secondary_color,
        buttonBackgroundColor: primary_color,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.decelerate,
        items: const [
          Icon(Icons.home),
          Icon(Icons.add),
          Icon(Icons.settings),
        ],
      ),
      body: screens[currentidx],
    );
  }
}
