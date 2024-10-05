import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hcmue/routes/app_pages.dart';
import 'package:hcmue/public/utils/constant.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    configEasyLoading();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      builder: (_, child) => GetMaterialApp(
        initialRoute: AppPages.splashScreen,
        getPages: AppPages.routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'OpenSans-Medium',
          scaffoldBackgroundColor: Colors.orange.shade50,
        ),
        builder: EasyLoading.init(),
      ),
    );
  }
}

void configEasyLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(seconds: 3)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = white
    ..indicatorColor = darkGray
    ..textColor = Colors.black
    ..maskType = EasyLoadingMaskType.black
    ..dismissOnTap = true;
}

Future<void> main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    // Addtional error logging
  };

  runApp(Phoenix(child: const MyApp()));
}
