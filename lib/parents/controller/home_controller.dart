import 'package:get/get.dart';

import 'package:hcmue/parents/view/home/home_body.dart';
import 'package:hcmue/parents/view/student-profile/student_profile.dart';

class HomeController extends GetxController {
  var currentIdx = 0.obs;
  var bottomNavigationBarPages = [
    const HomeScreen(),
    const StudentProfilePage(),
  ].obs;

  void changePages(int idx) {
    currentIdx.value = idx;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}
