import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/student/view/widgets/connection_state_messages.dart';
import 'package:hcmue/student/view/widgets/custom_button.dart';
import 'package:hcmue/student/view/quiz/quiz_question_shimmer_loading.dart';
import 'package:hcmue/student/controller/quiz_questions_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class QuizQuestionPage extends StatefulWidget {
  const QuizQuestionPage({super.key, required this.quizId});

  final String quizId;

  @override
  State<QuizQuestionPage> createState() => _QuizQuestionPageState();
}

class _QuizQuestionPageState extends State<QuizQuestionPage> {
  final QuizQuestionsController _controller =
      Get.put(QuizQuestionsController());

  void submitQuiz() {
    Get.snackbar('Quiz Submitted', 'Bạn đã nộp quiz.');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Danh sách câu hỏi',
            style: openSansRegularStyle(fontSize: 20.0, color: white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _controller.getQuestionsByQuizId(widget.quizId),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const QuizQuestionShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  if (_controller.questions.isEmpty) {
                    return const ErrorMessage(msg: "Không có dữ liệu câu hỏi");
                  } else {
                    return Obx(() {
                      final question = _controller
                          .questions[_controller.currentQuestionIdx.value];

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(height: 15.0),
                          Text(
                            "Câu hỏi ${_controller.currentQuestionIdx.value + 1}:",
                            style: openSansBoldStyle().copyWith(
                              decoration: TextDecoration.underline,
                              decorationThickness: 3.0,
                            ),
                          ),
                          const SizedBox(height: 10.0),
                          Text(
                            question.question,
                            style: openSansBoldStyle(fontSize: 14.0),
                          ),
                          const SizedBox(height: 10.0),
                          ...List.generate(
                            question.options.length,
                            (idx) {
                              return RadioListTile<int>(
                                title: Text(
                                  question.options[idx].text,
                                  style: openSansMediumStyle(),
                                ),
                                value: idx,
                                activeColor: primaryColor,
                                groupValue: _controller.selectedAnswers[
                                    _controller.currentQuestionIdx.value],
                                onChanged: (value) {
                                  _controller.selectAnswer(
                                      _controller.currentQuestionIdx.value,
                                      value!);
                                },
                              );
                            },
                          ),
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              ElevatedButton(
                                onPressed:
                                    _controller.currentQuestionIdx.value > 0
                                        ? _controller.previousQuestion
                                        : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: white,
                                  foregroundColor: darkGray,
                                ),
                                child: const Icon(Icons.arrow_back),
                              ),
                              ElevatedButton(
                                onPressed:
                                    _controller.currentQuestionIdx.value <
                                            _controller.questions.length - 1
                                        ? _controller.nextQuestion
                                        : null,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: white,
                                  foregroundColor: darkGray,
                                ),
                                child: const Icon(Icons.arrow_forward),
                              ),
                            ],
                          ),
                          if (_controller.currentQuestionIdx.value >=
                              _controller.questions.length - 1)
                            Center(
                              heightFactor: 2.5,
                              child: CustomButton(
                                title: 'Nộp bài',
                                press: submitQuiz,
                              ),
                            ),
                        ],
                      );
                    });
                  }
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
