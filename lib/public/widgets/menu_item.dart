import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/public/utils/constant.dart';

Widget menuItem({
  required IconData icon,
  required final Function press,
  LinearGradient? color,
  Color? backgroundColor,
  Color? splashColor,
}) {
  return InkWell(
    onTap: () => press.call(),
    splashColor: splashColor ?? primaryColor.withOpacity(0.3),
    child: Container(
      width: 80.w,
      height: 80.h,
      decoration: BoxDecoration(
        gradient: color ?? gradientColor,
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: white),
        ],
      ),
    ),
  );
}
