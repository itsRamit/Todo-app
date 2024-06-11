import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/widgets/label.dart';

class TaskScreen extends StatefulWidget {
  TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bg_color,
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              label(fontWeight: FontWeight.bold, text: "Calender", size: 22),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secondary_color),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: HorizontalWeekCalendar(
                    initialDate: DateTime.now(),
                    minDate: DateTime(2024, 3),
                    maxDate: DateTime(2024, 12),
                    borderRadius: BorderRadius.circular(12),
                    inactiveBackgroundColor: secondary_color,
                    activeBackgroundColor: primary_color,
                    activeTextColor: text_color,
                    inactiveTextColor: text_color,
                    activeNavigatorColor: text_color,
                    inactiveNavigatorColor: text_color,
                    monthColor: text_color,
                    scrollPhysics: BouncingScrollPhysics(),
                    onDateChange: (date) {
                      setState(() {
                        // selectedDate = date;
                      });
                    },
                  ),
                ),
              ),
              label(
                  fontWeight: FontWeight.bold,
                  text: "Tasks in progress",
                  size: 22),
              Container(
                width: w,
                decoration: BoxDecoration(
                    color: secondary_color,
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: h / 9,
                          decoration: BoxDecoration(
                              color: bg_color,
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.asset(
                            'assets/images/none.png',
                            fit: BoxFit.fitWidth,
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Container(
                        // height: h / 9,
                        margin: EdgeInsets.only(right: 8, top: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "headline of task headline of task",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              "headline of task headline of task headline of task headline of taskheadline of task headline of taskheadline of task headline of task",
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Container(
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
