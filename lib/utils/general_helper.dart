import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:login_page/utils/colors.dart';
import 'package:login_page/widgets/big_text.dart';
import 'package:login_page/widgets/small_text.dart';

class GeneralHelper {
  // static Future<XFile?> pickerImage() async {
  //   try {
  //     final ImagePicker picker = ImagePicker();
  //
  //     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  //
  //     return image;
  //   } catch (e) {}
  // }

  static void showSnackBar(
      {required BuildContext context, required String message}) {
    final snackBar = SnackBar(
      content: BigText(
        text: message,
        size: 14,
        color: Colors.black,
      ),
      backgroundColor: whiteColor,
      behavior: SnackBarBehavior.floating,
      // padding: EdgeInsets.all(10),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      action: SnackBarAction(
        label: 'Dismiss',
        disabledTextColor: Colors.white,
        textColor: Colors.black,
        onPressed: () {
          //Do whatever you want
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  static Future<void> snackBar({required String title,
    required String message,
    bool isError = false}) async {
    Get.snackbar(title, message,
        backgroundColor: isError ? redColor : greenColor,
        duration: const Duration(seconds: 5),
        colorText: whiteColor);
  }

  // static void noInternetPopUp() {
  //   Get.dialog(
  //       barrierDismissible: true,
  //       Dialog(
  //         backgroundColor: redColor,
  //         child: WillPopScope(
  //           onWillPop: () async => false,
  //           child: Container(
  //             padding: EdgeInsets.all(10),
  //             decoration: BoxDecoration(
  //                 color: redColor, borderRadius: BorderRadius.circular(40)),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //                 Center(
  //                   child: BigText(
  //                     text: "No Internet Connection",
  //                     color: whiteColor,
  //                     fontWeight: FontWeight.w700,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 // Image.asset(AppImage.internetConnection,height:30),
  //                 Padding(
  //                   padding: EdgeInsets.symmetric(horizontal: 10),
  //                   child: BigText(
  //                     text:
  //                     "Please check your connection again,or connect to wi-fi.",
  //                     color: whiteColor,
  //                     size: 12,
  //                   ),
  //                 ),
  //                 Divider(
  //                   color: whiteColor,
  //                   thickness: 1,
  //                 ),
  //
  //                 // Inkwell(
  //                 //   onTap: () {
  //                 //     Get.to(() => const AllVideoScreen());
  //                 //   }, child: Center(
  //                 //   child: Container(
  //                 //     height:50,
  //                 //     width: 30,
  //                 //     alignment: Alignment.center,
  //                 //     decoration: BoxDecoration(
  //                 //         color: AppColor.blackWhite,
  //                 //         borderRadius: const BorderRadius.all(Radius.circular(10))
  //                 //     ),
  //                 //     child: Text(
  //                 //       "Refresh",
  //                 //
  //                 //     ),
  //                 //   ),
  //                 // ),),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ));
  // }
  //
  // static monthsPopUp(List<String> months, BuildContext context,
  //     VoidCallback pressed) async {
  //   Get.dialog(
  //     // barrierDismissible: true,
  //       Dialog(
  //         shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.all(Radius.circular(32.0))),
  //         backgroundColor: whiteColor,
  //         child: Container(
  //           padding: EdgeInsets.all(20),
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               Center(
  //                 child: SmallText(
  //                   text: "Months",
  //                   color: lightGreenColor,
  //                   size: 25.sp,
  //                   fontWeight: FontWeight.w700,
  //                 ),
  //               ),
  //               Divider(thickness: 1, color: lightGreenColor,),
  //
  //               SizedBox(
  //                 height: 10,
  //               ),
  //               // Image.asset(AppImage.internetConnection,height:30),
  //               SizedBox(
  //                 height: MediaQuery
  //                     .of(context)
  //                     .size
  //                     .height * 0.4,
  //                 child: ListView.builder(
  //                     shrinkWrap: true,
  //                     itemCount: months.length,
  //                     itemBuilder: (context, index) {
  //                       return GetBuilder<HomeCore>(
  //                           init: HomeCore(),
  //                           builder: (homeCoreObj) {
  //                             return GetBuilder<HomeController>(
  //                                 init: HomeController(),
  //                                 builder: (homeObj) {
  //                               return Padding(
  //                                 padding: const EdgeInsets.all(8.0),
  //                                 child: GestureDetector(
  //                                   onTap: () {
  //                                     pressed();
  //
  //                                     homeCoreObj.setMonth(months[index]);
  //                                     homeObj.updatePressed(true);
  //
  //                                     homeCoreObj.getWeekDaysAndDates(
  //                                         index + 1);
  //                                     if(homeCoreObj.month != DateFormat('MMMM').format(DateTime.now())){
  //                                       logs("here");
  //                                       homeObj.setPressAttention(0);
  //                                       logs("here ${homeObj.pressedAttentionIndex}");
  //
  //                                     }else{
  //                                       logs("there");
  //
  //                                       homeObj.setPressAttention(DateTime.now().day - 1);
  //                                       logs("There ${homeObj.pressedAttentionIndex}");
  //
  //                                     }
  //                                     Navigator.pop(context);
  //
  //                                   },
  //                                   child: SmallText(text: months[index],
  //                                     size: 20.sp,
  //                                     color: aspectRatioBorderColor,
  //                                   ),
  //                                 ),
  //                               );
  //                             });
  //                           });
  //                     }),
  //               ),
  //               Divider(
  //                 color: whiteColor,
  //                 thickness: 1,
  //               ),
  //
  //               // Inkwell(
  //               //   onTap: () {
  //               //     Get.to(() => const AllVideoScreen());
  //               //   }, child: Center(
  //               //   child: Container(
  //               //     height:50,
  //               //     width: 30,
  //               //     alignment: Alignment.center,
  //               //     decoration: BoxDecoration(
  //               //         color: AppColor.blackWhite,
  //               //         borderRadius: const BorderRadius.all(Radius.circular(10))
  //               //     ),
  //               //     child: Text(
  //               //       "Refresh",
  //               //
  //               //     ),
  //               //   ),
  //               // ),),
  //             ],
  //           ),
  //         ),
  //       ));
  // }
}
