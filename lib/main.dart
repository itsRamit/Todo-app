import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/Screen/AddTaskScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todo_app/Screen/ProfileScreen.dart';
import 'package:todo_app/Screen/TaskScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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

List<Widget> screens = [taskscreen(), Addtask(), ProfileScreen()];

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
        backgroundColor: Colors.black, //image.assets("Path")
        color: Color(0xff616B7B),
        buttonBackgroundColor: Colors.green,
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.decelerate,
        items: const [
          Icon(Icons.home),
          Icon(Icons.add),
          Icon(Icons.settings),
        ],
      ),
      body:screens[currentidx],
    );
  }
}


