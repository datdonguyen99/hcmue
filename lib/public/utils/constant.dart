import 'package:flutter/material.dart';

const primaryColor = Color(0xFF3CB878);
const secondaryColor = Color(0xFFF15B26);
const activeTextColor = Color(0xFF0056B3);
const darkTurquoise = Color(0xFF4CC2C0);
const orange = Color(0xFFFCB03B);
const lightTurquoise1 = Color(0xFF9BF2E2);
const lightTurquoise2 = Color(0xFFB6F2E7);
const titleColor = Color(0xFF6DCCF2); // used Only once
const darkGray = Color(0xFF606060); //The main text color
const gray = Color(0xFFA4A4A4);
const secondaryGray = Color(0xFFACACAC);
const dark = Color(0xFF2F2C2C);
const lightGray = Color(0xFFD4D4D4);
const backgroundColor = Color(0xFFF6F6F6);
const white = Color(0xFFFFFFFF);
const loadingPrimarycolor = Color.fromARGB(255, 211, 211, 211);

const gradientColor = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    secondaryColor,
    primaryColor,
  ],
);
const gradientColor2 = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    Colors.white,
    Colors.white,
  ],
);
const gradientColor3 = LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [
    lightTurquoise2,
    lightTurquoise1,
  ],
);

class Pics {
  String adminGreyPic = 'assets/images/admin.png';
  String studentGreyPic = 'assets/images/student.png';
  String teacherGreyPic = 'assets/images/teacher.png';
  String parentGreyPic = 'assets/images/parents.png';
  String backgroundPic = 'assets/images/login-background-squares.png';
}
