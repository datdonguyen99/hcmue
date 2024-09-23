import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/parents/view/widgets/appbar.dart';
import 'package:hcmue/parents/view/widgets/connection_state_messages.dart';
import 'package:hcmue/parents/controller/student_result_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class StudentResultPage extends StatefulWidget {
  const StudentResultPage({super.key});

  @override
  State<StudentResultPage> createState() => _StudentResultPageState();
}

class _StudentResultPageState extends State<StudentResultPage> {
  final StudentResultController _controller =
      Get.put(StudentResultController());

  String selectedSemester = '';

  @override
  void initState() {
    super.initState();
    _controller.getSemesters().then((_) {
      if (_controller.semesters.isNotEmpty) {
        setState(() {
          selectedSemester = _controller.semesters[0].id;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Kết quả học học sinh',
            style: openSansRegularStyle(fontSize: 20, color: white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DropdownButton<String>(
                value: selectedSemester.isNotEmpty
                    ? selectedSemester
                    : _controller.semesters.isNotEmpty
                        ? _controller.semesters[0].id
                        : null,
                items: [
                  ..._controller.semesters.map((semester) {
                    return DropdownMenuItem<String>(
                      value: semester.id,
                      child: Text(semester.name),
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
              ),
              const SizedBox(height: 20),
              Text(
                "Kết quả kì $selectedSemester",
                style: openSansMediumStyle(fontSize: 20, color: gray),
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
          ),
        ),
      ),
    );
  }
}
