import 'package:get/get.dart';

import 'package:hcmue/student/models/lesson_model.dart';
import 'package:hcmue/student/services/lesson_service.dart';

class LessonRepository {
  final LessonService _lessonService = Get.put(LessonService());

  Future<List<LessonModel>> fetchLessonsByCourseId() async {
    try {
      final data = await _lessonService.fetchLessonsByCourseId();
      return data.map((json) => LessonModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch lessons by courseId');
    }
  }
}
