import 'package:get/get.dart';

import 'package:hcmue/student/models/quiz_model.dart';
import 'package:hcmue/student/services/quiz_service.dart';

class QuizRepository {
  final QuizService _quizService = Get.put(QuizService());

  Future<List<QuizModel>> fetchQuizzesByCourseId() async {
    try {
      final data = await _quizService.fetchQuizzesByCourseId();
      return data.map((json) => QuizModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch quizzes by courseId');
    }
  }
}
