import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrasiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrasiController());
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: Get.width / 2,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.all(15),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Icon(
                            Icons.monetization_on_outlined,
                            size: 70,
                            color: Get.theme.primaryColor.withGreen(125),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      bottom: Get.height / 30,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Registrasi",
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: EdgeInsets.all(15),
                          child: Text(
                            "Dhuwitku",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Get.theme.primaryColor,
                      Get.theme.scaffoldBackgroundColor
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Text(
                        "Selamat Bergabung",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: controller.nama,
                        cursorColor: Get.theme.primaryColor,
                        decoration: InputDecoration(
                          labelText: "Nama",
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: controller.email,
                        cursorColor: Get.theme.primaryColor,
                        decoration: InputDecoration(
                          labelText: "Email",
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: controller.password,
                        cursorColor: Get.theme.primaryColor,
                        decoration: InputDecoration(
                          labelText: "Kata Sandi",
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(15),
                      child: TextFormField(
                        controller: controller.konfirmasiPassword,
                        cursorColor: Get.theme.primaryColor,
                        decoration: InputDecoration(
                          labelText: "Konfirmasi Kata Sandi",
                          labelStyle: TextStyle(
                            color: Get.theme.primaryColor,
                          ),
                          filled: true,
                          fillColor: Colors.grey.shade100,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Center(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Get.theme.primaryColor,
                          fixedSize: Size(Get.width / 1.5, Get.height / 18),
                        ),
                        child: Text("Registrasi"),
                        onPressed: () {
                          controller.registrasi();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
