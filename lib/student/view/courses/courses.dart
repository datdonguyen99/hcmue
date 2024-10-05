import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/student/view/widgets/connection_state_messages.dart';
import 'package:hcmue/student/view/widgets/rating.dart';
import 'package:hcmue/student/view/courses/courses_shimmer_loading.dart';
import 'package:hcmue/student/view/courses/course_detail.dart';
import 'package:hcmue/student/controller/courses_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIdx = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIdx = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Danh sách các khóa học',
            style: openSansRegularStyle(fontSize: 20.0, color: white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _selectedIdx == 0
                            ? const Icon(Icons.arrow_drop_down)
                            : const Icon(Icons.arrow_right),
                        SizedBox(width: 4.w),
                        const Text('Lớp'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _selectedIdx == 1
                            ? const Icon(Icons.arrow_drop_down)
                            : const Icon(Icons.arrow_right),
                        SizedBox(width: 4.w),
                        const Text('Khối'),
                      ],
                    ),
                  ),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: gray,
                indicatorColor: primaryColor,
                isScrollable: true,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    CourseList(type: 'class'),
                    CourseList(type: 'grade'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CourseList extends StatefulWidget {
  const CourseList({super.key, required this.type});

  final String type;

  @override
  State<CourseList> createState() => _CourseListState();
}

class _CourseListState extends State<CourseList> {
  final CoursesController _controller = Get.put(CoursesController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.type == 'class'
          ? _controller.getCoursesByClass()
          : _controller.getCoursesByGrade(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CoursesShimmerLoading();
        } else {
          if (snapshot.hasError) {
            return const ErrorMessage();
          } else {
            return Column(
              children: [
                const SizedBox(height: 10.0),
                if (_controller.courses.isEmpty)
                  const ErrorMessage(msg: "Không có dữ liệu khóa học")
                else
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: _controller.courses.length,
                      separatorBuilder: (context, idx) =>
                          const SizedBox(height: 5.0),
                      itemBuilder: (BuildContext context, int idx) {
                        var course = _controller.courses[idx];
                        return Card(
                          elevation: 4,
                          color: white,
                          margin: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: <Widget>[
                                Column(
                                  children: [
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
                                    const SizedBox(height: 10.0),
                                    GestureDetector(
                                      onTap: () {
                                        Get.to(() =>
                                            CourseDetailPage(course: course));
                                      },
                                      child: Text(
                                        'Chi tiết',
                                        style: openSansMediumStyle(
                                          fontSize: 11.0,
                                          color: activeTextColor,
                                        ).copyWith(
                                          fontStyle: FontStyle.italic,
                                          decoration: TextDecoration.underline,
                                          decorationColor: activeTextColor,
                                          decorationThickness: 3.0,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 16.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        course.title,
                                        style:
                                            openSansBoldStyle(fontSize: 15.0),
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        course.description,
                                        style: openSansRegularStyle(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 4.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Tác giả:',
                                            style: openSansMediumStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            course.author,
                                            style: openSansMediumStyle(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 8.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Đánh giá:',
                                            style: openSansMediumStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Rating(
                                            rating: course.rating,
                                            size: 20.0,
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4.0),
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
    );
  }
}
