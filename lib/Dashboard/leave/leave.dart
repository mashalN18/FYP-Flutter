import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_page/Dashboard/leave/leave_controller.dart';
import 'package:login_page/controller/leaves_controller.dart';
import 'LeaveCustomContainer.dart';

class LeaveScreen extends StatefulWidget {

  @override
  State<LeaveScreen> createState() => _LeaveScreenState();
}

class _LeaveScreenState extends State<LeaveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<LeaveController>(
          init: LeaveController(),
          builder: (leaveObj) {
        return Stack(
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
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 20, bottom: 20),
                  child: Row(
                    children: [
                      Text(
                        'Leave',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Spacer(),
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.search),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 90,
              left: 0,
              right: 0,
              bottom: 0,
              child: ListView.builder(
                itemCount: leaveObj.leavesList.length,
                itemBuilder: (context, index) {
                  return LeaveCustomContainer(leaveModel: leaveObj
                      .leavesList[index]);
                },
              ),
            )
          ],
        );
      }),
    );
  }
}
