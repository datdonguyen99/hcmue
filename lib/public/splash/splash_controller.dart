import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  late GetStorage _storage;

  @override
  void onInit() async {
    _storage = GetStorage();
    await checkID();
    super.onInit();
  }

  Future<void> checkID() async {
    String? uid = await _storage.read('user_id');
    // print(uid);
    if (uid != null) {
      Get.offAllNamed('/sthome');
    } else {
      Get.offNamed('/login');
    }
  }
}
