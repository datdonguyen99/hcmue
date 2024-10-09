import 'package:get/get.dart';

import 'package:hcmue/public/login/login_screen.dart';
import 'package:hcmue/public/splash/splash_screen.dart';
import 'package:hcmue/student/binding/home.dart';
import 'package:hcmue/student/binding/notification.dart';
import 'package:hcmue/student/binding/profile.dart';
import 'package:hcmue/student/view/home/home.dart';
import 'package:hcmue/student/view/my-courses/my_courses.dart';
import 'package:hcmue/student/view/quiz/quiz_result.dart';
import 'package:hcmue/student/view/chat/chat_page.dart';
import 'package:hcmue/student/view/notification/notification_page.dart';
import 'package:hcmue/student/view/profile/profile_page.dart';
import 'package:hcmue/parents/view/home/home.dart';
import 'package:hcmue/parents/view/student-profile/student_profile.dart';
import 'package:hcmue/parents/view/student-history/student_history.dart';
import 'package:hcmue/parents/view/student-result/student_result.dart';
import 'package:hcmue/parents/view/top-up/top_up.dart';

class AppPages {
  AppPages._();

  static const initial = '/login';
  static const splashScreen = '/splash';
  static const studentHome = '/sthome';
  static const studentCourses = '/stcourses';
  static const studentQuizResults = '/stquiz/result';
  static const studentChat = '/stchat';
  static const studentNoti = '/stnoti';
  static const studentProfile = '/stprofile';
  static const parenthome = '/prthome';
  static const parentStudentProfile = '/prt/sthome';
  static const parentStudentHistory = '/prt/sthistory';
  static const parentStudentResult = '/prt/stresult';
  static const parentTopUp = '/prt/topup';

  static final routes = [
    GetPage(
      name: initial,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: studentHome,
      page: () => const StudentHome(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: studentCourses,
      page: () => const MyCoursesPage(),
    ),
    GetPage(
      name: studentQuizResults,
      page: () => const QuizResultPage(),
    ),
    GetPage(
      name: studentChat,
      page: () => const ChatPage(),
    ),
    GetPage(
      name: studentNoti,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: studentProfile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: parenthome,
      page: () => const ParentsHome(),
    ),
    GetPage(
      name: parentStudentProfile,
      page: () => const StudentProfilePage(),
    ),
    GetPage(
      name: parentStudentHistory,
      page: () => const StudentHistoryPage(),
    ),
    GetPage(
      name: parentStudentResult,
      page: () => const StudentResultPage(),
    ),
    GetPage(
      name: parentTopUp,
      page: () => const TopUpPage(),
    ),
  ];
}
