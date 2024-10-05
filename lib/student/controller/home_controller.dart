import 'package:get/get.dart';

import 'package:hcmue/student/view/home/home_body.dart';
// import 'package:hcmue/student/view/chat/chat_page.dart';
// import 'package:hcmue/student/view/notification/notification_page.dart';
// import 'package:hcmue/student/view/profile/profile_page.dart';

class HomeController extends GetxController {
  var currentIdx = 0.obs;
  var bottomNavigationBarPages = [
    const HomeScreen(),
    // const ChatPage(),
    // const NotificationPage(),
    // const ProfilePage(),
  ].obs;
  var appBarTitles = ['Home', 'Chats', 'Notifications', 'Account'].obs;

  void changePages(int idx) {
    currentIdx.value = idx;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
