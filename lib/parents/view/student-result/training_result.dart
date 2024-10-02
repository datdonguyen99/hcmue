import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import 'package:hcmue/parents/view/widgets/connection_state_messages.dart';
import 'package:hcmue/parents/view/student-result/learning_result_shimmer_loading.dart';
import 'package:hcmue/parents/controller/student_result_controller.dart';
import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_style.dart';

class TrainingResultPage extends StatefulWidget {
  const TrainingResultPage({super.key});

  @override
  State<TrainingResultPage> createState() => _TrainingResultPageState();
}

class _TrainingResultPageState extends State<TrainingResultPage> {
  final StudentResultController _controller =
      Get.put(StudentResultController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          _buildHeader('Chi tiết kết quả học tập tuần'),
          FutureBuilder(
            future: _controller.getStudentResultByWeek(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LearningResultShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  final listWeeklyCourses = _controller.weeklyResults;
                  if (listWeeklyCourses.isEmpty) {
                    return const ErrorMessage(
                        msg: "Không có dữ liệu kết quả học tập tuần");
                  } else {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listWeeklyCourses.length,
                      separatorBuilder: (context, idx) =>
                          const Divider(thickness: 1.5),
                      itemBuilder: (context, idx) {
                        final weeklyCourse = listWeeklyCourses[idx];
                        final listWeeklyTest = weeklyCourse.weeklyTests;
                        List<String> columnField = [
                          'Tuần',
                          'Tên bài kiểm tra',
                          'Điểm',
                        ];
                        return ExpansionTileCard(
                          elevation: 7,
                          baseColor: white,
                          expandedColor: lightTurquoise2,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 6,
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
                              Icons.menu_book,
                              size: 30,
                              color: white,
                            ),
                          ),
                          title: Text(
                            weeklyCourse.courseName,
                            style: openSansRegularStyle(fontSize: 15.0),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onExpansionChanged: (bool expanded) {},
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DataTable(
                                headingTextStyle:
                                    openSansBoldStyle(fontSize: 11.0),
                                dataTextStyle:
                                    openSansRegularStyle(fontSize: 11.0),
                                dataRowMinHeight: 44.h,
                                dataRowMaxHeight: 54.h,
                                columnSpacing: 28.w,
                                showBottomBorder: true,
                                decoration: BoxDecoration(
                                  color: white,
                                  border: Border.all(color: gray),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                columns: <DataColumn>[
                                  ...columnField.map((title) {
                                    return DataColumn(label: Text(title));
                                  }),
                                ],
                                rows: [
                                  ...listWeeklyTest.map<DataRow>((test) {
                                    return DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text('${test.weekNumber}'),
                                      ),
                                      DataCell(
                                        Text(
                                          test.testName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DataCell(
                                        Text(test.testScore != null
                                            ? '${test.testScore}'
                                            : 'N/A'),
                                      ),
                                    ]);
                                  }),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    );
                  }
                }
              }
            },
          ),
          const SizedBox(height: 20),
          _buildHeader('Chi tiết kết quả học tập tháng'),
          FutureBuilder(
            future: _controller.getStudentResultByMonth(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LearningResultShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  final listMonthlyCourses = _controller.monthlyResults;
                  if (listMonthlyCourses.isEmpty) {
                    return const ErrorMessage(
                        msg: "Không có dữ liệu kết quả học tập tháng");
                  } else {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: listMonthlyCourses.length,
                      separatorBuilder: (context, idx) =>
                          const Divider(thickness: 1.5),
                      itemBuilder: (context, idx) {
                        final monthlyCourse = listMonthlyCourses[idx];
                        final listMonthlyTest = monthlyCourse.monthlyTests;
                        List<String> columnField = [
                          'Tháng',
                          'Tên bài kiểm tra',
                          'Điểm',
                        ];
                        return ExpansionTileCard(
                          elevation: 7,
                          baseColor: white,
                          expandedColor: lightTurquoise2,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 6,
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
                              Icons.library_books,
                              size: 30,
                              color: white,
                            ),
                          ),
                          title: Text(
                            monthlyCourse.courseName,
                            style: openSansRegularStyle(fontSize: 15.0),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          onExpansionChanged: (bool expanded) {},
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DataTable(
                                headingTextStyle:
                                    openSansBoldStyle(fontSize: 11.0),
                                dataTextStyle:
                                    openSansRegularStyle(fontSize: 11.0),
                                dataRowMinHeight: 44.h,
                                dataRowMaxHeight: 54.h,
                                columnSpacing: 28.w,
                                showBottomBorder: true,
                                decoration: BoxDecoration(
                                  color: white,
                                  border: Border.all(color: gray),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                columns: <DataColumn>[
                                  ...columnField.map((title) {
                                    return DataColumn(label: Text(title));
                                  }),
                                ],
                                rows: [
                                  ...listMonthlyTest.map<DataRow>((test) {
                                    return DataRow(cells: <DataCell>[
                                      DataCell(
                                        Text('${test.monthNumber}'),
                                      ),
                                      DataCell(
                                        Text(
                                          test.testName,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      DataCell(
                                        Text(test.testScore != null
                                            ? '${test.testScore}'
                                            : 'N/A'),
                                      ),
                                    ]);
                                  }),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                          ],
                        );
                      },
                    );
                  }
                }
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Column(
      children: [
        Text(
          title,
          style: openSansBoldStyle(fontSize: 16.0),
        ),
        const SizedBox(height: 20.0),
      ],
    );
  }
}
