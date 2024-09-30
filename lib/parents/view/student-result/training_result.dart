import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/parents/view/widgets/connection_state_messages.dart';
import 'package:hcmue/parents/view/student-result/learning_result_shimmer_loading.dart';
import 'package:hcmue/parents/controller/student_result_controller.dart';
import 'package:hcmue/public/utils/constant.dart';

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

    _controller.getSemesters().then((_) {
      if (_controller.semesters.isNotEmpty) {}
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _controller.getSemesters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LearningResultShimmerLoading();
        } else {
          if (snapshot.hasError) {
            return const ErrorMessage();
          } else {
            return GetBuilder(
                init: StudentResultController(),
                builder: (controller) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      if (_controller.studentResults.isEmpty)
                        const ErrorMessage(msg: "Không có dữ liệu khóa học")
                      else
                        Expanded(
                          child: ListView.separated(
                            itemCount: _controller.studentResults.length,
                            separatorBuilder: (context, idx) =>
                                const SizedBox(height: 5),
                            itemBuilder: (BuildContext context, int idx) {
                              var result = _controller.studentResults[idx];
                              return Card(
                                elevation: 4,
                                color: white,
                                child: ListTile(
                                  leading: SizedBox(
                                    width: 160.w,
                                    child: Text(
                                      result.subject,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  title: Text("${result.score}"),
                                  trailing: Container(
                                    width: 30,
                                    height: 30,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: result.grade == 'A'
                                          ? Colors.green
                                          : Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Text(
                                      result.grade,
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  );
                });
          }
        }
      },
    );
  }
}
