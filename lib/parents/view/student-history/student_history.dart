import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:hcmue/parents/view/widgets/appbar.dart';
import 'package:hcmue/parents/view/widgets/connection_state_messages.dart';
import 'package:hcmue/parents/view/widgets/card_infor.dart';
import 'package:hcmue/parents/view/student-history/student_history_shimmer_loading.dart';
import 'package:hcmue/parents/controller/student_history_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class StudentHistoryPage extends StatefulWidget {
  const StudentHistoryPage({super.key});

  @override
  State<StudentHistoryPage> createState() => _StudentHistoryPageState();
}

class _StudentHistoryPageState extends State<StudentHistoryPage> {
  final StudentHistoryController _controller =
      Get.put(StudentHistoryController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Lịch sử học sinh',
            style: openSansRegularStyle(fontSize: 20, color: white),
          ),
        ),
        body: FutureBuilder(
          future: _controller.getListStudentHistory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const StudentHistoryShimmerLoading();
            } else {
              if (snapshot.hasError) {
                return const ErrorMessage();
              } else {
                final listCourseHistory = _controller.studentHistory;
                if (listCourseHistory.isEmpty) {
                  return const ErrorMessage(
                      msg: "Không có dữ liệu lịch sử học sinh");
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 16,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Chi tiết lịch sử học tập',
                          style: openSansBoldStyle(fontSize: 16.0),
                        ),
                        const SizedBox(height: 20.0),
                        Expanded(
                          child: ListView.separated(
                            itemCount: listCourseHistory.length,
                            separatorBuilder: (context, idx) =>
                                const Divider(thickness: 1.5),
                            itemBuilder: (context, idx) {
                              final courseHistory = listCourseHistory[idx];
                              return ExpansionTileCard(
                                  elevation: 7,
                                  baseColor: white,
                                  expandedColor: lightTurquoise2,
                                  contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 8,
                                  ),
                                  leading: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                          primaryColor,
                                          secondaryColor,
                                        ],
                                        tileMode: TileMode.mirror,
                                      ).createShader(bounds);
                                    },
                                    child: const Icon(
                                      Icons.book,
                                      size: 30,
                                      color: white,
                                    ),
                                  ),
                                  title: Text(
                                    courseHistory.title,
                                    style: openSansRegularStyle(fontSize: 15.0),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  onExpansionChanged: (bool expanded) {},
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            courseHistory.description,
                                            style: openSansRegularStyle(
                                                fontSize: 13.0),
                                          ),
                                          const SizedBox(height: 20.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              CardInfor(
                                                fullname: "Ngày bắt đầu:",
                                                name: DateFormat('dd/MM/yyyy')
                                                    .format(courseHistory
                                                        .startDate),
                                                icon: Icons.calendar_today,
                                                width: 130.w,
                                              ),
                                              SizedBox(width: 5.w),
                                              CardInfor(
                                                fullname: "Ngày hoàn thành:",
                                                name: DateFormat('dd/MM/yyyy')
                                                    .format(courseHistory
                                                        .completionDate),
                                                icon: Icons.calendar_today,
                                                width: 130.w,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              CardInfor(
                                                fullname: "Tiến độ:",
                                                name:
                                                    '${courseHistory.completionLevel}%',
                                                icon: Icons.hourglass_empty,
                                                width: 130.w,
                                              ),
                                              SizedBox(width: 40.w),
                                              CircularPercentIndicator(
                                                radius: 50.0,
                                                lineWidth: 13.0,
                                                animation: true,
                                                percent: courseHistory
                                                        .completionLevel /
                                                    100,
                                                center: Text(
                                                  '${courseHistory.completionLevel}%',
                                                  style: openSansMediumStyle(),
                                                ),
                                                circularStrokeCap:
                                                    CircularStrokeCap.round,
                                                progressColor: courseHistory
                                                            .completionLevel >
                                                        80
                                                    ? primaryColor
                                                    : courseHistory
                                                                .completionLevel >
                                                            50
                                                        ? orange
                                                        : secondaryColor,
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 20.0),
                                        ],
                                      ),
                                    ),
                                  ]);
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
            }
          },
        ),
      ),
    );
  }
}
