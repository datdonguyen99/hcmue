import 'package:get/get.dart';

import 'package:hcmue/parents/services/student_history_service.dart';
import 'package:hcmue/parents/models/student_history_model.dart';

class StudentHistoryController extends GetxController {
  var services = StudentHistoryService();
  var studentHistory = <StudentHistoryModel>[].obs;

  getListStudentHistory() async {
    studentHistory.value = await services.fetchStudentHistory();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
