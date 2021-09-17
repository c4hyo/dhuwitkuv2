import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final email = TextEditingController();
  final password = TextEditingController();
  final nama = TextEditingController();
  final konfirmasiPassword = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  Rxn<User> _user = Rxn<User>();
  User? get user => _user.value;

  void logout() async {
    // _user.value = User();
    await auth.signOut();
  }

  void sendEmailVerification() async {
    await user?.sendEmailVerification();
    Get.defaultDialog(
      barrierDismissible: false,
      title: "Informasi",
      middleText: "Cek email anda untuk verifikasi akun",
      confirm: ElevatedButton(
        onPressed: () {
          logout();
          Get.back();
        },
        child: Text("Tutup"),
      ),
    );
  }

  void reset() {
    email.clear();
    password.clear();
    konfirmasiPassword.clear();
    nama.clear();
  }

  @override
  void onInit() {
    super.onInit();
    _user.bindStream(auth.authStateChanges());
  }
}

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
  }
}

class RegistrasiController extends AuthController {
  var loading = false.obs;

  void registrasi() async {
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
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email.text.trim(),
        password: password.text.trim(),
      );
      userCredential.user!.updateDisplayName(nama.text.trim());
      loading.value = false;
      reset();
      Get.back();
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}

class LoginController extends AuthController {
  var loading = false.obs;
  void login() async {
    if (email.text.trim().isEmpty || password.text.trim().isEmpty) {
      Get.snackbar("Error", "Form harus di isi semua");
    }
    try {
      loading.value = true;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email.text.trim(), password: password.text.trim());

      loading.value = false;

      reset();
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }
}

class LupaPasswordController extends AuthController {
  var loading = false.obs;
  void lupaPassword() async {
    if (email.text.trim().isEmpty) {
      Get.snackbar("Error", "Email harus di isi");
    }
    await auth.sendPasswordResetEmail(email: email.text.trim());
    reset();
  }
}
