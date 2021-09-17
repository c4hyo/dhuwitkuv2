import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifikasiEmailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    print(auth.user!.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text("Verifikasi email anda"),
      ),
      body: Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Get.theme.primaryColor,
            fixedSize: Size(Get.width / 1.5, Get.height / 18),
          ),
          child: Text("Verifikasi email anda"),
          onPressed: () => auth.sendEmailVerification(),
        ),
      ),
    );
  }
}
