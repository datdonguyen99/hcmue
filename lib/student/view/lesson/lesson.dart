import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/student/view/widgets/connection_state_messages.dart';
import 'package:hcmue/student/view/lesson/lesson_shimmer_loading.dart';
import 'package:hcmue/student/view/lesson/lesson_video.dart';
import 'package:hcmue/student/controller/lessons_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({super.key});

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  final LessonsController _controller = Get.put(LessonsController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Danh sách bài học',
            style: openSansRegularStyle(fontSize: 20.0, color: white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _controller.getLessonsByCourseId(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LessonShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  return Column(
                    children: [
                      const SizedBox(height: 10.0),
                      if (_controller.lessons.isEmpty)
                        const ErrorMessage(msg: "Không có dữ liệu bài học")
                      else
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: _controller.lessons.length,
                            separatorBuilder: (context, idx) =>
                                const SizedBox(height: 5.0),
                            itemBuilder: (BuildContext context, int idx) {
                              var lesson = _controller.lessons[idx];
                              return Card(
                                elevation: 4.0,
                                color: white,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 16.0,
                                  ),
                                  leading: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                          activeTextColor,
                                          primaryColor,
                                        ],
                                        tileMode: TileMode.mirror,
                                      ).createShader(bounds);
                                    },
                                    child: const Icon(
                                      Icons.ondemand_video,
                                      size: 30.0,
                                      color: white,
                                    ),
                                  ),
                                  title: Column(
                                    children: <Widget>[
                                      Text(
                                        lesson.title,
                                        style:
                                            openSansMediumStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Text(
                                            "Thời lượng:",
                                            style: openSansBoldStyle(),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            "${lesson.duration} phút",
                                            style: openSansMediumStyle(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                      LinearPercentIndicator(
                                        width: 180.w,
                                        animation: true,
                                        animationDuration: 1000,
                                        lineHeight: 10.0,
                                        leading: Text(
                                          "Tiến độ:",
                                          style: openSansBoldStyle(),
                                        ),
                                        percent: lesson.completionLevel / 100,
                                        center: Text(
                                          "${lesson.completionLevel}%",
                                          style: openSansMediumStyle(
                                            fontSize: 5.0,
                                            color: Colors.black,
                                          ),
                                        ),
                                        barRadius: const Radius.circular(10.0),
                                        progressColor:
                                            lesson.completionLevel > 80
                                                ? primaryColor
                                                : lesson.completionLevel > 50
                                                    ? orange
                                                    : secondaryColor,
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    Get.to(
                                      () => LessonVideoPage(
                                          videoUrl: lesson.videoUrl),
                                    );
                                  },
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
      ),
    );
  }
}
