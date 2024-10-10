import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/student/view/widgets/connection_state_messages.dart';
import 'package:hcmue/student/view/widgets/custom_button.dart';
import 'package:hcmue/student/view/my-courses/my_courses_shimmer_loading.dart';
import 'package:hcmue/student/view/lesson/lesson.dart';
import 'package:hcmue/student/view/quiz/quiz.dart';
import 'package:hcmue/student/view/question/question.dart';
import 'package:hcmue/student/controller/my_courses_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class MyCoursesPage extends StatefulWidget {
  const MyCoursesPage({super.key});

  @override
  State<MyCoursesPage> createState() => _MyCoursesPageState();
}

class _MyCoursesPageState extends State<MyCoursesPage> {
  final MyCoursesController _controller = Get.put(MyCoursesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Khóa học của tôi',
            style: openSansRegularStyle(fontSize: 20.0, color: white),
          ),
        ),
        body: FutureBuilder(
          future: _controller.getMyCourses(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const MyCoursesShimmerLoading();
            } else {
              if (snapshot.hasError) {
                return const ErrorMessage();
              } else {
                return Column(
                  children: [
                    const SizedBox(height: 10.0),
                    if (_controller.myCourses.isEmpty)
                      const ErrorMessage(
                          msg: "Không có dữ liệu khóa học của tôi")
                    else
                      Expanded(
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: _controller.myCourses.length,
                          separatorBuilder: (context, idx) =>
                              const SizedBox(height: 5.0),
                          itemBuilder: (BuildContext context, int idx) {
                            var course = _controller.myCourses[idx];
                            return Card(
                              elevation: 4,
                              color: white,
                              margin: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: <Widget>[
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        course.imageUrl,
                                        width: 100.w,
                                        height: 100.h,
                                        fit: BoxFit.cover,
                                        errorBuilder: (
                                          BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace,
                                        ) {
                                          return Image.asset(
                                            'assets/images/default_image.png',
                                            width: 100.w,
                                            height: 100.h,
                                            fit: BoxFit.cover,
                                          );
                                        },
                                      ),
                                    ),
                                    SizedBox(width: 20.w),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            course.title,
                                            style: openSansBoldStyle(),
                                          ),
                                          const SizedBox(height: 20.0),
                                          CustomButton(
                                            height: 45.h,
                                            title: 'Học ngay',
                                            style: openSansMediumStyle(
                                              fontSize: 15.0,
                                              color: white,
                                            ),
                                            press: () {
                                              Get.to(() => const LessonPage());
                                            },
                                          ),
                                          const SizedBox(height: 10.0),
                                          CustomButton(
                                            height: 45.h,
                                            title: 'Làm quizz',
                                            style: openSansMediumStyle(
                                              fontSize: 15.0,
                                              color: white,
                                            ),
                                            press: () {
                                              Get.to(() => const QuizPage());
                                            },
                                          ),
                                          const SizedBox(height: 10.0),
                                          CustomButton(
                                            height: 45.h,
                                            title: 'Câu hỏi',
                                            style: openSansMediumStyle(
                                              fontSize: 15.0,
                                              color: white,
                                            ),
                                            press: () {
                                              Get.to(
                                                () => const QuestionPage(),
                                              );
                                            },
                                          ),
                                          const SizedBox(height: 10.0),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}
