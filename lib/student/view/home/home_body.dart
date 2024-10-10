import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hcmue/student/view/courses/courses.dart';
import 'package:hcmue/student/view/my-courses/my_courses.dart';
import 'package:hcmue/student/view/quiz/quiz_result.dart';
import 'package:hcmue/public/widgets/menu_item.dart';
import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              elevation: 10,
              color: backgroundColor,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.school_outlined,
                          color: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.purple,
                              Colors.orange,
                            ],
                          ),
                          press: () {
                            Get.to(() => const CoursesPage());
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Khóa học',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(indent: 40.0, endIndent: 40.0, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              elevation: 10,
              color: backgroundColor,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.menu_book,
                          color: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              orange,
                              secondaryColor,
                            ],
                          ),
                          press: () {
                            Get.to(() => const MyCoursesPage());
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Khóa học của tôi',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.question_answer,
                          color: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              darkTurquoise,
                              primaryColor,
                            ],
                          ),
                          press: () {
                            Get.to(() => const MyCoursesPage());
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Câu hỏi',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(indent: 40.0, endIndent: 40.0, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Card(
              elevation: 10,
              color: backgroundColor,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.check_circle,
                          color: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Color(0xFF97CBDC),
                              Color(0xFF018ABD),
                            ],
                          ),
                          press: () {
                            Get.to(() => const QuizResultPage());
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Kết quả quiz',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.assessment,
                          color: const LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [
                              Colors.lightGreenAccent,
                              Colors.lightGreen,
                            ],
                          ),
                          press: () {
                            // Get.to(() => const StudentResultPage());
                            // Get.toNamed('/prt/sthome');
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Kết quả học',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12.0,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
