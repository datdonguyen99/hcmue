import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:hcmue/parents/view/widgets/appbar.dart';
import 'package:hcmue/parents/view/widgets/connection_state_messages.dart';
import 'package:hcmue/parents/view/student-profile/student_profile_shimmer_loading.dart';
import 'package:hcmue/parents/controller/student_history_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

var _controller = Get.put(StudentHistoryController());

class StudentHistoryPage extends StatelessWidget {
  const StudentHistoryPage({super.key});

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
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: _controller.getListStudentHistory(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const StudentProfileShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  final listStudyHistory = _controller.studentHistory;
                  return Column(
                    children: [
                      ...listStudyHistory.map((history) {
                        return ListTile(
                          leading: const Icon(
                            Icons.menu_book,
                            color: gray,
                            size: 35.0,
                          ),
                          title: Text(
                            history.subject,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: Text(
                              DateFormat('dd/MM/yyyy').format(history.date)),
                          trailing: Text(
                            history.status,
                            style: TextStyle(
                              color: history.status == 'Completed'
                                  ? Colors.green
                                  : history.status == 'Pending'
                                      ? Colors.orange
                                      : Colors.red,
                            ),
                          ),
                        );
                      }),
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
