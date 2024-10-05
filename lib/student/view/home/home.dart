import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:hcmue/student/controller/home_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

final HomeController c = Get.find<HomeController>();

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Image.asset(
                  'assets/icons/logo-techdev.png',
                  height: 40.0,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Chào mừng bạn đến với ...',
                        textStyle: const TextStyle(fontSize: 10.0),
                        speed: const Duration(milliseconds: 100),
                      ),
                    ],
                    repeatForever: true,
                    pause: const Duration(seconds: 2),
                    displayFullTextOnTap: true,
                    stopPauseOnTap: true,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (c) => c.bottomNavigationBarPages[c.currentIdx.value],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          tooltip: 'No fuction',
          backgroundColor: secondaryColor,
          foregroundColor: white,
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomAppBar(
          clipBehavior: Clip.antiAlias,
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          color: primaryColor,
          elevation: 8.0,
          child: Obx(
            () => CustomNavigationBar(
              iconSize: 35.0,
              selectedColor: white,
              strokeColor: orange,
              unSelectedColor: lightGray,
              backgroundColor: Theme.of(context).primaryColor.withAlpha(0),
              elevation: 0,
              scaleFactor: 0.4,
              items: [
                CustomNavigationBarItem(
                  icon: const Icon(Icons.home),
                  title: Text(
                    "Home",
                    style: c.currentIdx.value == 0
                        ? openSansRegularStyle(fontSize: 10.0, color: white)
                        : openSansRegularStyle(
                            fontSize: 10.0, color: lightGray),
                  ),
                ),
                CustomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  title: Text(
                    "Setting",
                    style: c.currentIdx.value == 1
                        ? openSansRegularStyle(fontSize: 10.0, color: white)
                        : openSansRegularStyle(
                            fontSize: 10.0, color: lightGray),
                  ),
                ),
              ],
              currentIndex: c.currentIdx.value,
              onTap: (idx) => c.changePages(idx),
            ),
          ),
        ),
      ),
    );
  }
}
