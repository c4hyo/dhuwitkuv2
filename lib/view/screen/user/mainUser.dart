import 'package:dhuwitku_v2/controller/homeController.dart';
import 'package:dhuwitku_v2/view/screen/user/home.dart';
import 'package:dhuwitku_v2/view/screen/user/tambahKeuangan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final home = Get.put(HomeController());
    List<Widget> _tabs() => listScreen;
    final List<Widget> _tab = _tabs();
    return Obx(
      () => Scaffold(
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
      ),
    );
  }
}

List<Widget> listScreen = [
  HomeScreen(),
  TambahScreen(),
  Text("list keuangan"),
  Text("Pengaturan"),
];

List<BottomNavigationBarItem> bottomItem = [
  BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),
  BottomNavigationBarItem(
      icon: Icon(Icons.monetization_on_outlined), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), label: "Home"),
  BottomNavigationBarItem(icon: Icon(Icons.settings_outlined), label: "Home"),
];
