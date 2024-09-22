import 'package:flutter/material.dart';

const primaryColor = Color(0xFF9BF2E2);
const secondaryColor = Color(0xFFB6F2E7);
const titleColor = Color(0xFF6DCCF2); // used Only once
const darkGray = Color(0xFF606060); //The main text color
const gray = Color(0xFFA4A4A4);
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

class Pics {
  String adminGreyPic = 'assets/images/admin.png';
  String studentGreyPic = 'assets/images/student.png';
  String teacherGreyPic = 'assets/images/teacher.png';
  String parentGreyPic = 'assets/images/parents.png';
  String backgroundPic = 'assets/images/login-background-squares.png';
}
