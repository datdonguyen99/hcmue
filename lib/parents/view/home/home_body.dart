import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hcmue/public/widgets/menu_item.dart';
import 'package:hcmue/parents/view/student-profile/student_profile.dart';
import 'package:hcmue/parents/view/student-history/student_history.dart';
import 'package:hcmue/parents/view/student-result/student_result.dart';
import 'package:hcmue/parents/view/top-up/top_up.dart';
import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Card(
              elevation: 10,
              color: backgroundColor,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.account_circle,
                          color: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.purple,
                              Colors.orange,
                            ],
                          ),
                          press: () {
                            Get.to(() => const StudentProfilePage());
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Hồ sơ',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.description,
                          color: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              darkTurquoise,
                              primaryColor,
                            ],
                          ),
                          press: () {
                            Get.to(() => const StudentHistoryPage());
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Lịch sử',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.assessment,
                          color: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Colors.lightGreenAccent,
                              Colors.lightGreen,
                            ],
                          ),
                          press: () {
                            Get.to(() => const StudentResultPage());
                            // Get.toNamed('/prt/sthome');
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Kết quả',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(indent: 40.0, endIndent: 40.0, thickness: 1.5),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Card(
              elevation: 10,
              color: backgroundColor,
              margin: const EdgeInsets.only(left: 16.0, right: 16.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        menuItem(
                          icon: Icons.account_balance,
                          color: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              orange,
                              secondaryColor,
                            ],
                          ),
                          press: () {
                            Get.to(() => const TopUpPage());
                          },
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Nạp tiền',
                          textAlign: TextAlign.center,
                          style: openSansMediumStyle(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
