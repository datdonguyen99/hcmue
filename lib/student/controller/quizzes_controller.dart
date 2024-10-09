import 'package:get/get.dart';

import 'package:hcmue/student/models/quiz_model.dart';
import 'package:hcmue/student/repositories/quiz_repository.dart';

class QuizzesController extends GetxController {
  final QuizRepository _quizRepository = Get.put(QuizRepository());
  var quizzes = <QuizModel>[].obs;
  var isLoading = false.obs;

  Future<void> getQuizzesByCourseId() async {
    isLoading.value = true;
    try {
      quizzes.value = await _quizRepository.fetchQuizzesByCourseId();
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
