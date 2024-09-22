import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:hcmue/parents/view/widgets/appbar.dart';
import 'package:hcmue/parents/view/widgets/global_infor.dart';
import 'package:hcmue/parents/view/student-profile/student_profile_shimmer_loading.dart';
import 'package:hcmue/parents/view/widgets/connection_state_messages.dart';
import 'package:hcmue/parents/controller/student_profile_controller.dart';
import 'package:hcmue/public/utils/font_style.dart';
import 'package:hcmue/public/utils/constant.dart';

var _controller = Get.put(StudentProfileController());

class StudentProfilePage extends StatelessWidget {
  const StudentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: customAppBar(
            title: 'Hồ sơ học sinh',
            style: openSansRegularStyle(fontSize: 20, color: white),
          ),
        ),
        body: SingleChildScrollView(
          child: FutureBuilder(
            future: _controller.getStudentsInfoForParents(5),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const StudentProfileShimmerLoading();
              } else {
                if (snapshot.hasError) {
                  return const ErrorMessage();
                } else {
                  return GetBuilder(
                    init: StudentProfileController(),
                    builder: ((controller) {
                      return Column(
                        children: <Widget>[
                          SizedBox(height: 20.h),
                          Stack(
                            children: [
                              Container(
                                width: 135,
                                height: 135,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: white),
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(
                                        'assets/images/student.png'),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: -20,
                                top: 65,
                                left: 100,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: white),
                                    gradient: gradientColor,
                                  ),
                                  child: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.camera_alt,
                                      size: 17,
                                      color: white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          GlobalInfor(
                            fullname: "Họ tên: ",
                            name:
                                "${_controller.studentInfo.value.firstName} ${_controller.studentInfo.value.lastName}",
                            icon: Icons.person,
                          ),
                          const Divider(indent: 65),
                          Row(
                            children: [
                              GlobalInfor(
                                fullname: "Khối:",
                                name: "${_controller.studentInfo.value.grade}",
                                icon: Icons.school,
                                width: 100.w,
                              ),
                              SizedBox(width: 40.w),
                              GlobalInfor(
                                fullname: "Lớp:",
                                name: "${_controller.studentInfo.value.class_}",
                                icon: Icons.class_,
                                width: 100.w,
                              ),
                            ],
                          ),
                          const Divider(indent: 65),
                          GlobalInfor(
                            fullname: "Email: ",
                            name: "${_controller.studentInfo.value.email}",
                            icon: Icons.mail,
                          ),
                          const Divider(indent: 65),
                          GlobalInfor(
                            fullname: "Số điện thoại: ",
                            name:
                                "${_controller.studentInfo.value.phoneNumber}",
                            icon: Icons.call,
                          ),
                          const Divider(indent: 65),
                          GlobalInfor(
                            fullname: "Địa chỉ: ",
                            name: "${_controller.studentInfo.value.address}",
                            icon: Icons.place,
                          ),
                        ],
                      );
                    }),
                  );
                }
              }
            },
          ),
        ),
      ),
    );
  }
}
