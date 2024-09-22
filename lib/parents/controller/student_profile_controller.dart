import 'package:get/get.dart';

import 'package:hcmue/parents/services/student_profile_service.dart';
import 'package:hcmue/parents/models/student_profile_model.dart';

class StudentProfileController extends GetxController {
  var services = StudentProfileService();
  var studentInfo = StudentProfileModel().obs;

  getStudentsInfoForParents(int prtId) async {
    studentInfo.value = await services.fetchStudentInfor(prtId);
  }

  @override
  void onInit() {
    super.onInit();
  }
}
