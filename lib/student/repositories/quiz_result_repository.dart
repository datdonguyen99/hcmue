import 'package:get/get.dart';

import 'package:hcmue/student/models/quiz_result_model.dart';
import 'package:hcmue/student/services/quiz_result_service.dart';

class QuizResultRepository {
  final QuizResultService _quizResultService = Get.put(QuizResultService());

  Future<List<QuizResultModel>> fetchQuizResultByStudentId() async {
    try {
      final data = await _quizResultService.fetchQuizResultByStudentId();
      Map<String, QuizResultModel> resultMap = {};

      for (var json in data) {
        String quizId = json['quiz_id'];

        if (!resultMap.containsKey(quizId)) {
          resultMap[quizId] = QuizResultModel(
            id: quizId,
            title: json['title'],
            totalQuestions: json['total_questions'],
            totalCorrectAnswers: json['total_correct_answers'],
            score: json['score'],
            questionResults: [],
          );
        }

        resultMap[quizId]!.questionResults.add(QuestionResult.fromJson(json));
      }

      return resultMap.values.toList();
    } catch (e) {
      throw Exception('Failed to fetch quiz result by studentId');
    }
  }
}
