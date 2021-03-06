import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:dhuwitku_v2/controller/dataController.dart';
import 'package:dhuwitku_v2/controller/homeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pengaturan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final home = Get.find<HomeController>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("${auth.user?.displayName}"),
                accountEmail: Text("${auth.user?.email}"),
              ),
              Card(
                child: ListTile(
                  onTap: () {
                    Get.defaultDialog(
                      title: "Konfirmasi",
                      middleText: "Apakah anda keluar",
                      barrierDismissible: false,
                      confirm: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Get.theme.primaryColor.withRed(220),
                        ),
                        onPressed: () {
                          auth.logout();
                          home.indexHalaman.value = 0;
                          Get.back();
                          Get.delete<DataController>();
                        },
                        child: Text("Ya"),
                      ),
                      cancel: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Get.theme.primaryColor,
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Tidak"),
                      ),
                    );
                  },
                  title: Text("Keluar"),
                  trailing: Icon(
                    Icons.logout_outlined,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
