import 'package:get/get.dart';

import 'package:hcmue/student/services/course_service.dart';
import 'package:hcmue/student/models/course_model.dart';

class CoursesController extends GetxController {
  var services = CourseService();
  var courses = <CourseModel>[].obs;
  var isLoading = false.obs;

  Future<void> getCoursesByClass() async {
    isLoading.value = true;
    try {
      courses.value = await services.fetchCourseByClass();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCoursesByGrade() async {
    isLoading.value = true;
    try {
      courses.value = await services.fetchCourseByGrade();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
