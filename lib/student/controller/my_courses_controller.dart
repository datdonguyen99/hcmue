import 'package:get/get.dart';

import 'package:hcmue/student/models/course_model.dart';
import 'package:hcmue/student/repositories/my_course_repository.dart';

class MyCoursesController extends GetxController {
  final MyCourseRepository myCourseRepository = Get.put(MyCourseRepository());
  var myCourses = <CourseModel>[].obs;
  var isLoading = false.obs;

  Future<void> getMyCourses() async {
    isLoading.value = true;
    try {
      myCourses.value = await myCourseRepository.fetchMyCourses();
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
