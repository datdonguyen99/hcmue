import 'package:get/get.dart';

import 'package:hcmue/student/models/course_model.dart';
import 'package:hcmue/student/services/course_service.dart';

class MyCourseRepository {
  final CourseService _courseService = Get.put(CourseService());

  Future<List<CourseModel>> fetchMyCourses() async {
    try {
      final data = await _courseService.fetchMyCourses();
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch my courses');
    }
  }
}
