import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/parents/view/widgets/appbar.dart';
import 'package:hcmue/parents/view/student-result/learning_result.dart';
import 'package:hcmue/parents/view/student-result/training_result.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

class StudentResultPage extends StatefulWidget {
  const StudentResultPage({super.key});

  @override
  State<StudentResultPage> createState() => _StudentResultPageState();
}

class _StudentResultPageState extends State<StudentResultPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIdx = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIdx = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TabBar(
                controller: _tabController,
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _selectedIdx == 0
                            ? const Icon(Icons.arrow_drop_down)
                            : const Icon(Icons.arrow_right),
                        SizedBox(width: 4.w),
                        const Text('KQ học tập'),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _selectedIdx == 1
                            ? const Icon(Icons.arrow_drop_down)
                            : const Icon(Icons.arrow_right),
                        SizedBox(width: 4.w),
                        const Text('KQ rèn luyện'),
                      ],
                    ),
                  ),
                ],
                labelColor: Colors.black,
                unselectedLabelColor: gray,
                indicatorColor: primaryColor,
                isScrollable: true,
              ),
              const SizedBox(height: 16.0),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    LearningResultPage(),
                    TrainingResultPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
