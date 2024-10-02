import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hcmue/parents/view/widgets/appbar.dart';
import 'package:hcmue/parents/controller/top_up_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

var _controller = Get.put(TopUpController());

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Nạp tiền hằng năm',
            style: openSansRegularStyle(fontSize: 20, color: white),
          ),
        ),
        body: const SingleChildScrollView(
          child: Text('TOP UP'),
        ),
      ),
    );
  }
}
