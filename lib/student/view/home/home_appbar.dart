import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hcmue/public/utils/constant.dart';

AppBar customHomeAppBar({String? title, TextStyle? style, Function()? ontap}) {
  return AppBar(
    elevation: 5,
    title: Row(
      children: [
        Text('$title', style: style),
      ],
    ),
    flexibleSpace: Container(
      decoration: const BoxDecoration(
        gradient: gradientColor,
        image: DecorationImage(
          image: AssetImage('assets/images/appbar-background-squares.png'),
          fit: BoxFit.cover,
        ),
      ),
    ),
    actions: [
      Row(
        children: [
          Padding(
            padding: EdgeInsets.only(
              right: 10.w,
              top: 10.h,
              bottom: 26.5.h,
              left: 15.w,
            ),
            child: IconButton(
              onPressed: ontap,
              icon: Icon(
                Icons.notifications,
                size: 32.w,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 12.w, top: 10.h, bottom: 26.5.h),
            child: IconButton(
              onPressed: () {
                // Get.to(() => TLessonScreen());
              },
              icon: const Icon(
                Icons.people_alt,
                size: 27,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}
