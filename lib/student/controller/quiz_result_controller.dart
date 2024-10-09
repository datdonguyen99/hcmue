import 'package:get/get.dart';

import 'package:hcmue/student/models/quiz_result_model.dart';
import 'package:hcmue/student/repositories/quiz_result_repository.dart';

class QuizResultController extends GetxController {
  final QuizResultRepository _quizResultRepository =
      Get.put(QuizResultRepository());
  var quizResult = <QuizResultModel>[].obs;
  var isLoading = false.obs;

  Future<void> getQuizResultByStudentId() async {
    isLoading.value = true;
    try {
      quizResult.value =
          await _quizResultRepository.fetchQuizResultByStudentId();
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
