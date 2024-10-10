import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/student/view/widgets/connection_state_messages.dart';
import 'package:hcmue/student/view/question/question_shimmer_loading.dart';
import 'package:hcmue/student/controller/question_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({super.key});

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  final QuestionController _controller = Get.put(QuestionController());

  Future<void> _refreshQuestions() async {
    await _controller.getQuestionsByCourseId();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Câu hỏi',
            style: openSansRegularStyle(fontSize: 20.0, color: white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _controller.getQuestionsByCourseId(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const QuestionShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  if (_controller.questions.isEmpty) {
                    return const ErrorMessage(msg: "Không có dữ liệu câu hỏi");
                  } else {
                    return RefreshIndicator(
                      displacement: 100.0,
                      strokeWidth: 2.0,
                      color: secondaryColor,
                      backgroundColor: primaryColor.withOpacity(0.5),
                      onRefresh: _refreshQuestions,
                      child: Obx(
                        () => ListView.builder(
                          shrinkWrap: true,
                          itemCount: _controller.questions.length,
                          itemBuilder: (context, idx) {
                            final question = _controller.questions[idx];
                            return Card(
                              margin: const EdgeInsets.symmetric(vertical: 8.0),
                              color: backgroundColor,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      radius: 15.0,
                                      backgroundImage: NetworkImage(
                                        question.imageUrl,
                                      ),
                                    ),
                                    const SizedBox(width: 10.0),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            question.fullName,
                                            style: openSansBoldStyle(),
                                          ),
                                          Text(
                                            DateFormat('dd/MM/yyyy')
                                                .format(question.createdAt),
                                            style: openSansRegularStyle(
                                              fontSize: 10.0,
                                            ),
                                          ),
                                          const SizedBox(height: 10.0),
                                          Text(
                                            question.content,
                                            style: openSansRegularStyle(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
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
