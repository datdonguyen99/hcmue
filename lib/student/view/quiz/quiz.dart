import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/student/view/widgets/connection_state_messages.dart';
import 'package:hcmue/student/view/quiz/quiz_shimmer_loading.dart';
import 'package:hcmue/student/view/quiz/quiz_question.dart';
import 'package:hcmue/student/controller/quizzes_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final QuizzesController _controller = Get.put(QuizzesController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Danh sách quizzes',
            style: openSansRegularStyle(fontSize: 20.0, color: white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _controller.getQuizzesByCourseId(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const QuizShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  return Column(
                    children: <Widget>[
                      const SizedBox(height: 10.0),
                      if (_controller.quizzes.isEmpty)
                        const ErrorMessage(msg: "Không có dữ liệu quizzes")
                      else
                        Expanded(
                          child: ListView.separated(
                            shrinkWrap: true,
                            itemCount: (_controller.quizzes.length / 2).ceil(),
                            separatorBuilder: (context, idx) =>
                                const SizedBox(height: 5.0),
                            itemBuilder: (BuildContext context, int idx) {
                              var quiz = _controller.quizzes[idx];
                              return Card(
                                elevation: 4.0,
                                color: white,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10.0,
                                    horizontal: 16.0,
                                  ),
                                  leading: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: <Color>[
                                          activeTextColor,
                                          primaryColor,
                                        ],
                                        tileMode: TileMode.mirror,
                                      ).createShader(bounds);
                                    },
                                    child: const Icon(
                                      Icons.quiz,
                                      size: 30.0,
                                      color: white,
                                    ),
                                  ),
                                  title: Column(
                                    children: <Widget>[
                                      Text(
                                        quiz.title,
                                        style:
                                            openSansMediumStyle(fontSize: 14),
                                      ),
                                      const SizedBox(height: 10.0),
                                      Row(
                                        children: [
                                          Text(
                                            "Thời gian:",
                                            style: openSansBoldStyle(),
                                          ),
                                          const SizedBox(width: 10.0),
                                          Text(
                                            "${quiz.duration} phút",
                                            style: openSansMediumStyle(),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 5.0),
                                    ],
                                  ),
                                  onTap: () {
                                    Get.to(
                                      () => QuizQuestionPage(quizId: quiz.id),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
