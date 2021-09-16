import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrasiController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final nama = TextEditingController();
  final konfirmasiPassword = TextEditingController();
  var loading = false.obs;

  void registrasi() {
    if (email.text.trim().isEmpty ||
        nama.text.trim().isEmpty ||
        password.text.trim().isEmpty ||
        konfirmasiPassword.text.trim().isEmpty) {
      Get.snackbar("Error", "Form harus di isi semua");
    }
    if (!GetUtils.isEmail(email.text.trim())) {
      Get.snackbar("Error", "Format email salah");
    }
    if (password.text.trim() != konfirmasiPassword.text.trim()) {
      Get.snackbar("Error", "Konfirmasi kata sansi tidak sama");
    }
    if (password.text.trim().length < 8 ||
        konfirmasiPassword.text.trim().length < 8) {
      Get.snackbar("Error", "Panjang kata sandi minimal 8");
    }
    try {
      loading.value = true;
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}

class LoginController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  void login() {
    if (email.text.trim().isEmpty || password.text.trim().isEmpty) {
      Get.snackbar("Error", "Form harus di isi semua");
    }
  }
}

class LupaPasswordController extends GetxController {
  final email = TextEditingController();
  void lupaPassword() {
    if (email.text.trim().isEmpty) {
      Get.snackbar("Error", "Email harus di isi");
    }
  }
}
