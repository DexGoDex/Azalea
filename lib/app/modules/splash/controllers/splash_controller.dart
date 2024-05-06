import 'package:flutter_application_20/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  final getStorage = GetStorage();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    getStorage.write("status", "login");
  }

  @override
  void onReady() {
    super.onReady();
    if (getStorage.read("status") != "" && getStorage.read("status") != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(Routes.LOGIN);
      });
    } else {
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
