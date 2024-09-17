import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:hcmue/student/controller/notification_controller.dart';
import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_families.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 5,
          title: const Row(
            children: [
              Text(
                'Notifications',
                style: TextStyle(
                  color: white,
                  fontSize: 24,
                  fontFamily: OpenSans.regular,
                ),
              ),
            ],
          ),
          flexibleSpace: Container(
            height: 200,
            decoration: const BoxDecoration(
              gradient: gradientColor,
              image: DecorationImage(
                image:
                    AssetImage('assets/images/appbar-background-squares.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: SizedBox(
                  height: 770.h,
                  width: 428.w,
                  child: GetBuilder(
                    init: NotificationsController(),
                    builder: (controller) {
                      print('Notification in class');
                      return const Text(
                        'Notification in class',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 12,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
