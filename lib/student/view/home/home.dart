import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:hcmue/student/controller/home_controller.dart';
import 'package:hcmue/student/view/home/home_appbar.dart';
import 'package:hcmue/student/view/home/side_menu.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

final HomeController c = Get.find<HomeController>();

class StudentHome extends StatelessWidget {
  const StudentHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const SideMenu(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (c) => customHomeAppBar(
              title: c.appBarTitles[c.currentIdx.value],
              style: openSansRegularStyle(fontSize: 20, color: Colors.white),
              ontap: () => {},
            ),
          ),
        ),
        body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (c) => c.bottomNavigationBarPages[c.currentIdx.value],
        ),
        bottomNavigationBar: Obx(
          () => CustomNavigationBar(
            iconSize: 23.0,
            selectedColor: primaryColor,
            strokeColor: secondaryColor,
            unSelectedColor: Colors.grey[600],
            backgroundColor: Colors.white,
            borderRadius: const Radius.circular(10),
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
              CustomNavigationBarItem(
                icon: const Icon(Icons.message_outlined),
                title: Text(
                  "Chats",
                  style: c.currentIdx.value == 1
                      ? openSansRegularStyle(fontSize: 10, color: primaryColor)
                      : openSansRegularStyle(fontSize: 10, color: gray),
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.notifications_outlined),
                title: Text(
                  "Notifications",
                  style: c.currentIdx.value == 2
                      ? openSansRegularStyle(fontSize: 10, color: primaryColor)
                      : openSansRegularStyle(fontSize: 10, color: gray),
                ),
              ),
              CustomNavigationBarItem(
                icon: const Icon(Icons.people_outline),
                title: Text(
                  "Account",
                  style: c.currentIdx.value == 3
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
