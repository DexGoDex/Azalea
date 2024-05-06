import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_20/app/modules/login/bindings/login_binding.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_application_20/app/data/user.dart';

class HomeController extends GetxController {
  final User user;

  HomeController(this.user);

  final count = 0.obs;
  var photoUri = "".obs;

  @override
  void onInit() {
    super.onInit();
    if (user.photoUri != null) {
      photoUri.value = user.photoUri!;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void increment() => count.value++;

  void doUploadPhoto(int id) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    Directory dir = await getApplicationDocumentsDirectory();
    String localPath = "${dir.path}/${image.name}";

    image.saveTo(localPath);
    UserProvider().savePhoto(id, localPath);
    photoUri.value = localPath;
  }
}
