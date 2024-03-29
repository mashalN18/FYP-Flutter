import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:login_page/controller/task_screen_controller.dart';

import 'TaskCustomContainer.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen

  ({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  List<Map<String, String>> items = [
    {
      "Task": "Task 1",
      "Descrption": "write descrp here",
      "Start Date": "22-03-05",
      "End Date": "22-03-10",
      "Type ": " Type1",
      "Status": "status",
    },
    {
      "Task": "Task 2",
      "Descrption": "write descrp here",
      "Start Date": "22-03-05",
      "End Date": "22-03-10",
      "Type ": " Type 2",
      "Status": "status",
    },
    {
      "Task": "Task 3",
      "Descrption": "write descrp here",
      "Start Date": "22-03-05",
      "End Date": "22-03-10",
      "Type ": " Type 3",
      "Status": "status",
    },
    {
      "Task": "Task 4",
      "Descrption": "write descrp here",
      "Start Date": "22-03-05",
      "End Date": "22-03-10",
      "Type ": " Type",
      "Status": "status",
    },
  ];
  Color customColor = const Color(0xFF29BD89);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 150,
            child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 22, 101, 73),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      'Task',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.search),
                    )
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<TaskScreenController>(
              init: TaskScreenController(),
              builder: (taskScreenObj) {
            return Positioned(
                top: 90,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.builder(
                    itemCount: taskScreenObj.taskList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          TaskCustomContainer(
                            Task: "Task $index" ?? "",
                            Description:  taskScreenObj.taskList[index].description ?? "",
                            StartDate: DateFormat('dd-MM-yyyy').format(taskScreenObj.taskList[index].startDate) ?? "",
                            EndDate: DateFormat('dd-MM-yyyy').format(taskScreenObj.taskList[index].endDate) ?? "",
                            Type: taskScreenObj.taskList[index].type ?? "",
                            Status: taskScreenObj.taskList[index].taskStatus ?? "", image: taskScreenObj.taskList[index].taskImage,
                          )
                        ],
                      );
                    }));
          }),
        ],
      ),
    );
  }
}
