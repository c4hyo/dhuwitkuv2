import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:dhuwitku_v2/controller/dataController.dart';
import 'package:dhuwitku_v2/controller/homeController.dart';
import 'package:dhuwitku_v2/view/screen/auth/verifikasiEmail.dart';
import 'package:dhuwitku_v2/view/screen/user/daftarKeuangan.dart';
import 'package:dhuwitku_v2/view/screen/user/home.dart';
import 'package:dhuwitku_v2/view/screen/user/pengaturan.dart';
import 'package:dhuwitku_v2/view/screen/user/tambahKeuangan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final home = Get.put(HomeController());
    Get.put(DataController());
    final auth = Get.find<AuthController>();
    List<Widget> _tabs() => listScreen;
    final List<Widget> _tab = _tabs();
    return Obx(
      () => (auth.user?.emailVerified == true)
          ? Scaffold(
              bottomNavigationBar: BottomNavigationBar(
                items: bottomItem,
                type: BottomNavigationBarType.fixed,
                currentIndex: home.indexHalaman.value,
                onTap: (i) => home.indexHalaman.value = i,
                backgroundColor: Get.theme.primaryColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.black,
              ),
              body: SafeArea(
                child: _tab[home.indexHalaman.value],
              ),
            )
          : VerifikasiEmailScreen(),
    );
  }
}

List<Widget> listScreen = [
  ListKeuangan(),
  TambahScreen(),
  HomeScreen(),
  Pengaturan(),
];

List<BottomNavigationBarItem> bottomItem = [
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
  BottomNavigationBarItem(
      icon: Icon(Icons.monetization_on_outlined), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.info_outline), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Home"),
];
