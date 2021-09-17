import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:dhuwitku_v2/view/screen/auth/login.dart';
import 'package:dhuwitku_v2/view/screen/auth/verifikasiEmail.dart';
// import 'package:dhuwitku_v2/view/screen/auth/verifikasiEmail.dart';
import 'package:dhuwitku_v2/view/screen/user/mainUser.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: AuthBinding(),
      theme: ThemeData(
        primaryColor: Color(0xFF25703A),
        scaffoldBackgroundColor: Color(0xFFD6E0D6),
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: Wrap(),
    );
  }
}

class Wrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        child: (Get.find<AuthController>().user?.uid != null)
            ? UserMain()
            : LoginScreen(),
      ),
    );
  }
}
