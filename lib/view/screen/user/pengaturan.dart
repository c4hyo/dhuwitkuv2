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
    final data = Get.find<DataController>();
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
                    auth.logout();
                    data.clear();
                    home.indexHalaman.value = 0;
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
