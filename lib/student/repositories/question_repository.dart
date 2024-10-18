import 'package:get/get.dart';

import 'package:hcmue/student/models/question_model.dart';
import 'package:hcmue/student/services/question_service.dart';

class QuestionRepository {
  final QuestionService _questionService = Get.put(QuestionService());

  Future<List<QuestionModel>> fetchQuestionsByCourseId() async {
    try {
      final data = await _questionService.fetchQuestionsByCourseId();
      return data.map((json) => QuestionModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch questions by courseId');
    }
  }

  Future<bool> sendQuestion(QuestionModel question) async {
    try {
      bool isSend = await _questionService.sendQuestion(question.toJson());
      return isSend;
    } catch (e) {
      throw Exception('Failed to send questions');
    }
  }
}
