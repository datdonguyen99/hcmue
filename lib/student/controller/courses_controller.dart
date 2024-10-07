import 'package:get/get.dart';

import 'package:hcmue/student/models/course_model.dart';
import 'package:hcmue/student/repositories/course_repository.dart';

class CoursesController extends GetxController {
  final CourseRepository courseRepository = Get.put(CourseRepository());
  var courses = <CourseModel>[].obs;
  var isLoading = false.obs;

  Future<void> getCoursesByClass() async {
    isLoading.value = true;
    try {
      courses.value = await courseRepository.fetchCourseByClass();
      // ignore: empty_catches
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> getCoursesByGrade() async {
    isLoading.value = true;
    try {
      courses.value = await courseRepository.fetchCourseByGrade();
      // ignore: empty_catches
    } catch (e) {
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
