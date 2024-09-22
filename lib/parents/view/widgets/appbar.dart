import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hcmue/public/utils/constant.dart';

AppBar customAppBar({String? title, TextStyle? style, Function()? ontap}) {
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
    leading: IconButton(
      onPressed: ontap ?? () => Get.back(),
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
    // actions: [
    //   Row(
    //     children: [],
    //   ),
    // ],
  );
}
