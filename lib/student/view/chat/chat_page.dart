import 'package:flutter/material.dart';
import 'package:hcmue/student/view/widgets/messages_widget.dart';
import 'package:hcmue/student/view/widgets/new_message_widget.dart';
import 'package:hcmue/public/utils/constant.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: const MessagesWidget(),
              ),
            ),
            const NewMessageWidget(),
          ],
        ),
      ),
    );
  }
}
