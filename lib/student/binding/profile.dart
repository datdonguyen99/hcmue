import 'package:get/get.dart';

import 'package:hcmue/student/controller/student_profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<StudentProfileController>(StudentProfileController());
  }
}
