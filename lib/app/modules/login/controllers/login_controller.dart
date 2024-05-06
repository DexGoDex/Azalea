import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter_application_20/app/data/user.dart';
import 'package:flutter_application_20/app/modules/home/views/home_view.dart';

import '../../../routes/app_pages.dart';

class LoginController extends GetxController {
  final getStorage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void doLogin({
    required String username,
    required String password,
  }) async {
    bool isSuccess = false;

    User? user = await UserProvider().getUserByUsername(username);
    if (user == null) {
      isSuccess = false;
    } else {
      if (password == user.password) {
        isSuccess = true;
      }
    }

    if (isSuccess) {
      Get.snackbar("Sukses", "Login berhasil!",
          backgroundColor: Colors.green,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white);
      Get.to(HomeView(user!));
    } else {
      Get.snackbar("Gagal", "Username atau password salah!",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          colorText: Colors.white);
    }
  }

  @override
  void onClose() {}
}
