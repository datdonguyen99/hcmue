import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hcmue/student/controller/question_controller.dart';
import 'package:hcmue/student/models/question_model.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class QuestionForm extends StatefulWidget {
  const QuestionForm({super.key});

  @override
  State<QuestionForm> createState() => _QuestionFormState();
}

class _QuestionFormState extends State<QuestionForm> {
  final QuestionController _controller = Get.put(QuestionController());
  final _msgController = TextEditingController();
  String message = "";

  void sendMessage() {
    // FocusScope.of(context).unfocus();
    // print(message);
    // EasyLoading.show();
    final newQuestion = QuestionModel(
      id: '1',
      content: message,
      courseId: 'course_1',
      createdAt: DateTime.now(),
      userId: 1,
      fullName: 'Tech Dev',
      imageUrl: 'https://example.com/image.jpg',
    );

    _controller.sendQuestion(newQuestion);
    _msgController.clear();
    // EasyLoading.showSuccess('Thêm mới câu hỏi thành công');
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
        padding:
            MediaQuery.of(context).viewInsets.add(const EdgeInsets.all(16.0)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Container(
                width: 50.0,
                height: 7.0,
                decoration: BoxDecoration(
                  color: gray,
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Text(
              'Thêm câu hỏi mới',
              style: openSansBoldStyle(),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _msgController,
                    textCapitalization: TextCapitalization.sentences,
                    autocorrect: true,
                    enableSuggestions: true,
                    decoration: InputDecoration(
                      labelText: 'Nội dung câu hỏi',
                      hintText: 'Message',
                      filled: true,
                      fillColor: white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 1.5,
                          color: primaryColor,
                        ),
                      ),
                    ),
                    maxLines: 4,
                    onChanged: (value) => setState(() {
                      message = value;
                    }),
                  ),
                ),
                const SizedBox(width: 15.0),
                InkWell(
                  onTap: message.trim().isEmpty ? null : sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: primaryColor,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: secondaryColor,
                      size: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
