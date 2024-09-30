import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/parents/view/widgets/connection_state_messages.dart';
import 'package:hcmue/parents/view/student-result/learning_result_shimmer_loading.dart';
import 'package:hcmue/parents/controller/student_result_controller.dart';
import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_style.dart';

class LearningResultPage extends StatefulWidget {
  const LearningResultPage({super.key});

  @override
  State<LearningResultPage> createState() => _LearningResultPageState();
}

class _LearningResultPageState extends State<LearningResultPage> {
  final StudentResultController _controller =
      Get.put(StudentResultController());
  String selectedSemester = '';

  @override
  void initState() {
    super.initState();

    // _controller.getSemesters().then((_) {
    //   if (_controller.semesters.isNotEmpty) {
    //     setState(() {
    //       selectedSemester = _controller.semesters[0].id;
    //     });
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    // return GetBuilder(
    // init: StudentResultController(),
    // builder: ((StudentResultController _controller) {
    return FutureBuilder(
      future: _controller.getSemesters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LearningResultShimmerLoading();
        } else {
          if (snapshot.hasError) {
            return const ErrorMessage();
          } else {
            return Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Kết quả",
                      style: openSansMediumStyle(fontSize: 20, color: gray),
                    ),
                    const SizedBox(width: 10),
                    DropdownButton<String>(
                      value:
                          selectedSemester.isNotEmpty ? selectedSemester : null,
                      hint: Text(
                        "Chọn học kì",
                        style: openSansMediumStyle(fontSize: 16),
                      ),
                      items: [
                        ..._controller.semesters.map((semester) {
                          bool isSelected = semester.id == selectedSemester;
                          return DropdownMenuItem<String>(
                            value: semester.id,
                            child: Text(
                              semester.name,
                              style: openSansMediumStyle(fontSize: 16).copyWith(
                                color: isSelected ? Colors.black : darkGray,
                              ),
                            ),
                          );
                        }),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          _controller.getStudentResultBySemester(value);
                          setState(() {
                            selectedSemester = value;
                          });
                        }
                      },
                      dropdownColor: white,
                    ),
                  ],
                ),
                if (_controller.studentResults.isEmpty)
                  ErrorMessage(
                      msg: "Không có dữ liệu học tập cho kỳ $selectedSemester")
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
                                style: const TextStyle(color: Colors.black),
                              ),
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
    // }),
    // );
  }
}
