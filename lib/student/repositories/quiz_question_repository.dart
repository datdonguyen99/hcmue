import 'package:get/get.dart';

import 'package:hcmue/student/models/quiz_question_model.dart';
import 'package:hcmue/student/services/quiz_question_service.dart';

class QuizQuestionRepository {
  final QuizQuestionService _quizQuestionService =
      Get.put(QuizQuestionService());

  Future<List<QuestionModel>> fetchQuestionsByQuizId(String quizId) async {
    try {
      final data = await _quizQuestionService.fetchQuestionsByQuizId(quizId);
      Map<String, QuestionModel> resultMap = {};

      for (var json in data) {
        String questionId = json['question_id'];

        if (!resultMap.containsKey(questionId)) {
          resultMap[questionId] = QuestionModel(
            questionId: questionId,
            question: json['question'],
            options: [],
            correctAnswerIds: [],
          );
        }

        resultMap[questionId]!.options.add(OptionModel.fromJson(json));
      }

      return resultMap.values.toList();
    } catch (e) {
      throw Exception('Failed to fetch question by quizId');
    }
  }
}
