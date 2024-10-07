import 'package:get/get.dart';

import 'package:hcmue/student/models/lesson_model.dart';
import 'package:hcmue/student/repositories/lesson_repository.dart';

class LessonsController extends GetxController {
  final LessonRepository _lessonRepository = Get.put(LessonRepository());
  var lessons = <LessonModel>[].obs;
  var isLoading = false.obs;

  Future<void> getLessonsByCourseId() async {
    isLoading.value = true;
    try {
      lessons.value = await _lessonRepository.fetchLessonsByCourseId();
      // ignore: empty_catches
    } catch (e) {
    } finally {
      isLoading.value = false;
      // update();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
