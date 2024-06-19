import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/widgets/label.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bg_color,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16),
            child: Column(
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  width: w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: secondary_color,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0.1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: w / 7,
                        backgroundImage:
                            NetworkImage('https://via.placeholder.com/150'),
                      ),
                      SizedBox(height: 10),
                      label(
                        text: "John Doe",
                        size: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(height: 5),
                      Text(
                        'john.doe@example.com',
                        style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  width: w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: secondary_color,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0.1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: MyTasksSection(),
                ),
                SizedBox(height: 20),
                Container(
                  width: w,
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: secondary_color,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0.1,
                        blurRadius: 1,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label(
                        text: "Task completion graph",
                        size: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      TaskCompletionGraph(),
                    ],
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyTasksSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              label(
                text: "My Task",
                size: 18,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              TaskStatusCard('In-Process', 3, Colors.orange),
              TaskStatusCard('Completed', 125, Colors.green),
              TaskStatusCard('Total', 139, Colors.pink),
            ],
          ),
        ],
      ),
    );
  }
}

class TaskStatusCard extends StatelessWidget {
  final String label;
  final int count;
  final Color color;

  TaskStatusCard(this.label, this.count, this.color);

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        CircleAvatar(
          radius: w / 12,
          backgroundColor: color.withOpacity(0.2),
          child: Text(
            count.toString(),
            style: TextStyle(
                color: color, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
        ),
      ],
    );
  }
}

class TaskCompletionGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: w / 2,
      child: Stack(
        children: <Widget>[
          PieChart(
            PieChartData(
              sections: [
                PieChartSectionData(
                  color: primary_color,
                  value: 125,
                  title: 'Completed',
                  radius: w / 7,
                  titleStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                PieChartSectionData(
                  color: Colors.orange,
                  value: 3,
                  title: 'In-Process',
                  radius: w / 7,
                  titleStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                PieChartSectionData(
                  color: Colors.grey[300]!,
                  value: 11,
                  title: 'Pending',
                  radius: w / 7,
                  titleStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
              sectionsSpace: 2,
              centerSpaceRadius: 40,
            ),
          ),
          Positioned.fill(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '139',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
