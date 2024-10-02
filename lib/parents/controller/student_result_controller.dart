import 'package:get/get.dart';

import 'package:hcmue/parents/services/student_result_service.dart';
import 'package:hcmue/parents/models/student_result_model.dart';

class StudentResultController extends GetxController {
  var services = StudentResultService();
  var semesters = <SemesterModel>[].obs;
  var studentResults = <StudentResultModel>[].obs;
  var weeklyResults = <WeeklyResultModel>[].obs;
  var monthlyResults = <MonthlyResultModel>[].obs;
  var isLoading = false.obs;

  Future<void> getSemesters() async {
    isLoading.value = true;
    try {
      semesters.value = await services.fetchSemester();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getStudentResultBySemester(String semesterId) async {
    isLoading.value = true;
    try {
      studentResults.value =
          await services.fetchStudentResultBySemester(semesterId);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getStudentResultByWeek() async {
    isLoading.value = true;
    try {
      weeklyResults.value = await services.fetchStudentResultByWeek();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getStudentResultByMonth() async {
    isLoading.value = true;
    try {
      monthlyResults.value = await services.fetchStudentResultByMonth();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSemesters();
  }
}
