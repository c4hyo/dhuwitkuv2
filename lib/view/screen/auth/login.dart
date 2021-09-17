import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:dhuwitku_v2/view/screen/auth/lupaPassword.dart';
import 'package:dhuwitku_v2/view/screen/auth/registrasi.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
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
                            "Login",
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
                        "Selamat Datang",
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
                          labelText: "Password",
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
                      padding: EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(""),
                          GestureDetector(
                            onTap: () => Get.to(() => LupaPasswordScreen()),
                            child: Text(
                              "Lupa Kata Sandi",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Center(
                      child: Obx(
                        () => (controller.loading.isTrue)
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Get.theme.primaryColor,
                                  fixedSize:
                                      Size(Get.width / 1.5, Get.height / 18),
                                ),
                                child: Text("Login"),
                                onPressed: () {
                                  controller.login();
                                },
                              ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: Center(
                        child: InkWell(
                          onTap: () => Get.to(
                            () => RegistrasiScreen(),
                          ),
                          child: Text("Registrasi"),
                        ),
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
