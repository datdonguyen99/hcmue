import 'package:get/get.dart';

import 'package:hcmue/student/models/quiz_question_model.dart';
import 'package:hcmue/student/repositories/quiz_question_repository.dart';

class QuizQuestionsController extends GetxController {
  final QuizQuestionRepository _quizQuestionsRepository =
      Get.put(QuizQuestionRepository());
  var isLoading = false.obs;
  var questions = <QuestionModel>[].obs;
  var selectedAnswers = <int, int?>{}.obs;
  var currentQuestionIdx = 0.obs;

  void selectAnswer(int questionIdx, int answerIdx) {
    selectedAnswers[questionIdx] = answerIdx;
    // print('Selecting answer: selectedAnswers $selectedAnswers');
  }

  void nextQuestion() {
    if (currentQuestionIdx.value < questions.length - 1) {
      currentQuestionIdx.value += 1;
    }
  }

  void previousQuestion() {
    if (currentQuestionIdx.value > 0) {
      currentQuestionIdx.value -= 1;
    }
  }

  Future<void> getQuestionsByQuizId(String quizId) async {
    isLoading.value = true;
    try {
      questions.value =
          await _quizQuestionsRepository.fetchQuestionsByQuizId(quizId);
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
