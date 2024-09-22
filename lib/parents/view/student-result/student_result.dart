import 'package:flutter/material.dart';

import 'package:hcmue/parents/view/widgets/appbar.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class StudentResultPage extends StatefulWidget {
  const StudentResultPage({super.key});

  @override
  State<StudentResultPage> createState() => _StudentResultPageState();
}

class _StudentResultPageState extends State<StudentResultPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Kết quả học học sinh',
            style: openSansRegularStyle(fontSize: 20, color: white),
          ),
        ),
        body: const SingleChildScrollView(
          child: Text(
            'Kết quả học học sinh',
            style: TextStyle(
              color: primaryColor,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
