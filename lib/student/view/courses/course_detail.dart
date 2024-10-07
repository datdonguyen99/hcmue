import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/student/view/widgets/rating.dart';
import 'package:hcmue/student/view/widgets/custom_button.dart';
import 'package:hcmue/student/models/course_model.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class CourseDetailPage extends StatefulWidget {
  const CourseDetailPage({super.key, required this.course});

  final CourseModel course;

  @override
  State<CourseDetailPage> createState() => _CourseDetailPageState();
}

class _CourseDetailPageState extends State<CourseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: widget.course.title,
            style: openSansRegularStyle(fontSize: 20.0, color: white),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network(
                          widget.course.imageUrl,
                          width: 200.w,
                          height: 150.h,
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
                      const SizedBox(height: 25.0),
                      Text(
                        '${NumberFormat('#,###').format(widget.course.price)}đ',
                        style: openSansBoldStyle(fontSize: 25.0),
                      ),
                      const SizedBox(height: 10.0),
                      CustomButton(title: 'Thêm khoá học', press: () {}),
                    ],
                  ),
                ),
                const SizedBox(height: 25.0),
                Text(
                  'Mô tả:',
                  style: openSansBoldStyle(),
                ),
                const SizedBox(height: 5.0),
                Text(
                  widget.course.description,
                  style: openSansRegularStyle(),
                ),
                const SizedBox(height: 25.0),
                Row(
                  children: [
                    Text(
                      'Giáo viên:',
                      style: openSansBoldStyle(),
                    ),
                    const SizedBox(width: 10.0),
                    Text(
                      widget.course.author,
                      style: openSansRegularStyle(),
                    ),
                  ],
                ),
                const SizedBox(height: 25.0),
                Text(
                  'Khóa học bao gồm:',
                  style: openSansBoldStyle(),
                ),
                const SizedBox(height: 5.0),
                Row(
                  children: [
                    const Icon(
                      Icons.menu_book,
                      size: 25.0,
                      color: gray,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      ' ${widget.course.lectures} bài học',
                      style: openSansRegularStyle(),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    const Icon(
                      Icons.quiz,
                      size: 25.0,
                      color: gray,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      '${widget.course.quizzes} quizzes',
                      style: openSansRegularStyle(),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    const Icon(
                      Icons.hourglass_full,
                      size: 25.0,
                      color: gray,
                    ),
                    const SizedBox(width: 15.0),
                    Text(
                      ' ${widget.course.totalHours} giờ học',
                      style: openSansRegularStyle(),
                    ),
                  ],
                ),
                const SizedBox(height: 15.0),
                Row(
                  children: [
                    const Icon(
                      Icons.rate_review,
                      size: 25.0,
                      color: gray,
                    ),
                    const SizedBox(width: 15.0),
                    Rating(
                      rating: widget.course.rating,
                      size: 25.0,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
