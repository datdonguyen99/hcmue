import 'package:get/get.dart';

import 'package:hcmue/student/models/course_model.dart';
import 'package:hcmue/student/services/course_service.dart';

class CourseRepository {
  final CourseService _courseService = Get.put(CourseService());

  Future<List<CourseModel>> fetchCourseByClass() async {
    try {
      final data = await _courseService.fetchCourseByClass();
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch courses by class');
    }
  }

  Future<List<CourseModel>> fetchCourseByGrade() async {
    try {
      final data = await _courseService.fetchCourseByGrade();
      return data.map((json) => CourseModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch courses by grade');
    }
  }
}
