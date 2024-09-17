import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hcmue/routes/app_pages.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key, this.onPress});

  final onPress;
  // final contentController = TextEditingController();
  // final titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          InkWell(
            onTap: () {
              Get.toNamed(AppPages.studentProfile);
            },
            child: Container(
                // height: 135,
                // width: 135,
                // decoration: BoxDecoration(
                //   shape: BoxShape.circle,
                //   border: Border.all(color: Colors.grey),
                //   image: DecorationImage(
                //       image: NetworkImage(UserInformation.urlAvatr),
                //       fit: BoxFit.cover),
                ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
