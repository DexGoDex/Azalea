import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_20/app/modules/login/views/login_view.dart';
import 'package:get/get.dart';
import 'package:flutter_application_20/app/data/user.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final User user;
  HomeView(this.user);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController(this.user));

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/Bg-Home.png"),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Hello, ${user.name}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    controller.photoUri.value == ""
                        ? CircleAvatar(
                            backgroundImage: AssetImage('assets/logoAkun.png'),
                            radius: 25,
                          )
                        : CircleAvatar(
                            backgroundImage:
                                FileImage(File(controller.photoUri.value!)),
                          ),
                  ],
                )),
            Text(
              "How's your day going?",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 0.5,
              indent: 2,
              endIndent: 2,
            ),
            SizedBox(height: 10),
            Text(
              "My Email : ${user.email}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "My Phone Number : ${user.phoneNumber}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(
              "My Address : ${user.address}",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 100),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.doUploadPhoto(user.id!);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFD567CD),
                ),
                child: Text(
                  'Upload Foto',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Get.snackbar("Success", "Logout successful!",
                      backgroundColor: Colors.green,
                      snackPosition: SnackPosition.BOTTOM,
                      colorText: Colors.white);
                  Get.to(() => LoginView());
                  ;
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
