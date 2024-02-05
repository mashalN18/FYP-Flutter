import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:login_page/Dashboard/Resource/resourceCustomContainer.dart';
import 'package:login_page/controller/get_resources_controller.dart';


class ResourceScreen extends StatefulWidget {
  const ResourceScreen

  ({super.key});

  @override
  State<ResourceScreen> createState() => _ResourceScreenState();
}

class _ResourceScreenState extends State<ResourceScreen> {
  List<Map<String, String>> items = [
    {
      "Name Of Resource": "resource 1",
      "Type Of Resource": "type 1",
      "Date": "3/2/23",
      "Description": "write description here",
      "Status": "done",
    },
    {
      "Name Of Resource": "resource 2",
      "Type Of Resource": "type 2",
      "Date": "3/2/23",
      "Description": "write description here",
      "Status": "done",
    },
    {
      "Name Of Resource": "resource 3",
      "Type Of Resource": "type 1",
      "Date": "3/2/23",
      "Description": "write description here",
      "Status": "hold",
    },
    {
      "Name Of Resource": "resource 4",
      "Type Of Resource": "type 3",
      "Date": "3/2/23",
      "Description": "write description here",
      "Status": "cancel",
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
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: const Padding(
                padding: EdgeInsets.only(left: 20, bottom: 20),
                child: Row(
                  children: [
                    Text(
                      'Resource',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    // Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Icon(Icons.search),
                    )
                  ],
                ),
              ),
            ),
          ),
          GetBuilder<GetResourceController>(
              init: GetResourceController(),
              builder: (getResourcesObj) {
            return Positioned(
                top: 90,
                left: 0,
                right: 0,
                bottom: 0,
                child: ListView.builder(
                    itemCount: getResourcesObj.getResourcesList.length,
                    itemBuilder: (context, index) {
                      return ResourceCustomContainer(
                          customColor: customColor,
                          Status: getResourcesObj.getResourcesList[index].approval ?? "",
                          NameOfResource:
                          items[index]["Name Of Resource"] ?? "",
                          TypeOfResource:
                          items[index]["Type Of Resource"] ?? "",
                          Date: items[index]["Date"] ?? "",
                          Description: items[index]["Description"] ?? "");
                    }));
          }),
        ],
      ),
    );
  }
}
