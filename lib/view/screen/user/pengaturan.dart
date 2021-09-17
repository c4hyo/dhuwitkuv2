import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:dhuwitku_v2/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final home = Get.find<HomeController>();
    return Scaffold(
      body: ElevatedButton(
        child: Text("Logout"),
        onPressed: () {
          auth.logout();
          home.indexHalaman.value = 0;
        },
      ),
    );
  }
}
