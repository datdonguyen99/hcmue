import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';

import 'package:hcmue/student/view/widgets/appbar.dart';
import 'package:hcmue/student/view/widgets/connection_state_messages.dart';
import 'package:hcmue/student/view/quiz/quiz_result_shimmer_loading.dart';
import 'package:hcmue/student/controller/quiz_result_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class QuizResultPage extends StatefulWidget {
  const QuizResultPage({super.key});

  @override
  State<QuizResultPage> createState() => _QuizResultPageState();
}

class _QuizResultPageState extends State<QuizResultPage> {
  final QuizResultController _controller = Get.put(QuizResultController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Kết quả quizzes',
            style: openSansRegularStyle(fontSize: 20.0, color: white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder(
            future: _controller.getQuizResultByStudentId(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const QuizResultShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  if (_controller.quizResult.isEmpty) {
                    return const ErrorMessage(
                        msg: "Không có dữ liệu kết quả quiz");
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemCount: _controller.quizResult.length,
                      separatorBuilder: (context, idx) =>
                          const Divider(thickness: 1.5),
                      itemBuilder: (context, idx) {
                        final quiz = _controller.quizResult[idx];
                        final questionResults = quiz.questionResults;
                        List<String> columnField = [
                          'Câu hỏi',
                          'Kết quả',
                        ];
                        return ExpansionTileCard(
                          elevation: 7.0,
                          baseColor: white,
                          expandedColor: lightTurquoise2,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 6.0,
                            vertical: 8.0,
                          ),
                          leading: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: <Color>[
                                  Color(0xFFFAF0CA),
                                  orange,
                                ],
                                tileMode: TileMode.mirror,
                              ).createShader(bounds);
                            },
                            child: const Icon(
                              Icons.emoji_events,
                              size: 30,
                              color: white,
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                quiz.title,
                                style: openSansRegularStyle(fontSize: 15.0),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 15.0),
                              Row(
                                children: [
                                  const Icon(Icons.check, color: primaryColor),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    'Số câu đúng:',
                                    style: openSansBoldStyle(),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    '${quiz.totalCorrectAnswers}',
                                    style: openSansMediumStyle(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  const Icon(Icons.question_mark,
                                      color: titleColor),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    'Tổng câu hỏi:',
                                    style: openSansBoldStyle(),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    '${quiz.totalQuestions}',
                                    style: openSansMediumStyle(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5.0),
                              Row(
                                children: [
                                  const Icon(Icons.scale,
                                      color: secondaryColor),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    'Điểm:',
                                    style: openSansBoldStyle(),
                                  ),
                                  const SizedBox(width: 10.0),
                                  Text(
                                    '${quiz.score * 10}',
                                    style: openSansMediumStyle(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onExpansionChanged: (bool expanded) {},
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DataTable(
                                headingTextStyle:
                                    openSansBoldStyle(fontSize: 11.0),
                                dataTextStyle:
                                    openSansRegularStyle(fontSize: 11.0),
                                dataRowMinHeight: 44.h,
                                dataRowMaxHeight: 54.h,
                                columnSpacing: 28.w,
                                showBottomBorder: true,
                                decoration: BoxDecoration(
                                  color: white,
                                  border: Border.all(color: gray),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                columns: <DataColumn>[
                                  ...columnField.map((title) {
                                    return DataColumn(label: Text(title));
                                  }),
                                ],
                                rows: [
                                  ...questionResults.map<DataRow>((question) {
                                    return DataRow(
                                      cells: <DataCell>[
                                        DataCell(
                                          Text('${question.id}'),
                                        ),
                                        DataCell(
                                          Text(
                                            question.isCorrect ? 'Đúng' : 'Sai',
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                          ],
                        );
                      },
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
