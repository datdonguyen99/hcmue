import 'package:get/get.dart';

import 'package:hcmue/student/models/question_model.dart';
import 'package:hcmue/student/repositories/question_repository.dart';

class QuestionController extends GetxController {
  final QuestionRepository _questionRepository = Get.put(QuestionRepository());
  var questions = <QuestionModel>[].obs;
  var isLoading = false.obs;

  Future<void> getQuestionsByCourseId() async {
    isLoading.value = true;
    try {
      questions.value = await _questionRepository.fetchQuestionsByCourseId();
      // ignore: empty_catches
    } catch (e) {
    } finally {
      isLoading.value = false;
      // update();
    }
  }

  Future<void> sendQuestion(QuestionModel question) async {
    isLoading.value = true;
    try {
      bool isSend = await _questionRepository.sendQuestion(question);
      if (isSend) {
        questions.add(question);
        Get.snackbar('Success', 'Tạo câu hỏi thành công!');
      } else {
        Get.snackbar('Error', 'Tạo câu hỏi thất bại!');
      }
      // ignore: empty_catches
    } catch (e) {
    } finally {
      isLoading.value = false;
      update();
    }
  }

  @override
  void onInit() {
    super.onInit();
  }
}
