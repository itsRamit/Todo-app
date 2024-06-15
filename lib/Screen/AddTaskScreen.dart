import 'package:flutter/material.dart';
import 'package:horizontal_week_calendar/horizontal_week_calendar.dart';
import 'package:todo_app/const/const.dart';
import 'package:todo_app/widgets/label.dart';
import 'package:flutter/cupertino.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTaskScreen> {
  List<String> labels = ["Work", "Personal", "Shopping", "Fitness"];
  String? selectedLabel;

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: bg_color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, right: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                label(
                    fontWeight: FontWeight.bold, text: "Select Date", size: 22),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: secondary_color,
                  ),
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
                    text: "Task Heading",
                    size: 22),
                Container(
                  height: h / 15,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CupertinoTextField(
                    placeholder: 'Search',
                    placeholderStyle:
                        TextStyle(color: CupertinoColors.systemGrey),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                label(
                    fontWeight: FontWeight.bold,
                    text: "Task Description",
                    size: 22),
                Container(
                  height: h / 6, // Adjust the height as needed
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Changes position of shadow
                      ),
                    ],
                  ),
                  child: CupertinoTextField(
                    placeholder: 'Description',
                    minLines: 1,
                    maxLines: 10,
                    placeholderStyle:
                        TextStyle(color: CupertinoColors.systemGrey),
                    padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: CupertinoColors.white),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    textAlignVertical: TextAlignVertical.top,
                  ),
                ),
                label(
                    fontWeight: FontWeight.bold, text: "Task Label", size: 22),
                Wrap(
                  spacing: 8.0,
                  children: labels.map((label) {
                    bool isSelected = label == selectedLabel;
                    return ChoiceChip(
                      label: Text(label),
                      selected: isSelected,
                      onSelected: (bool selected) {
                        setState(() {
                          selectedLabel = selected ? label : null;
                        });
                      },
                      selectedColor: primary_color,
                      backgroundColor: secondary_color,
                      labelStyle: TextStyle(
                        color: isSelected
                            ? text_color
                            : CupertinoColors.systemGrey,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
