import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'package:hcmue/parents/controller/home_controller.dart';
import 'package:hcmue/public/utils/constant.dart';
import 'package:hcmue/public/utils/font_style.dart';

final HomeController c = Get.find<HomeController>();

class ParentsHome extends StatelessWidget {
  const ParentsHome({super.key});

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
                  height: 40,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText(
                        'Chào mừng bạn đến với ...',
                        textStyle: const TextStyle(fontSize: 10),
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
        bottomNavigationBar: Obx(
          () => CustomNavigationBar(
            iconSize: 25.0,
            selectedColor: primaryColor,
            strokeColor: secondaryColor,
            unSelectedColor: Colors.grey[600],
            backgroundColor: Colors.white,
            borderRadius: const Radius.circular(14),
            elevation: 8,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(Icons.home_outlined),
                title: Text(
                  "Home",
                  style: c.currentIdx.value == 0
                      ? openSansRegularStyle(fontSize: 10, color: primaryColor)
                      : openSansRegularStyle(fontSize: 10, color: gray),
                ),
              ),
            ],
            currentIndex: c.currentIdx.value,
            onTap: (idx) => c.changePages(idx),
          ),
        ),
      ),
    );
  }
}
