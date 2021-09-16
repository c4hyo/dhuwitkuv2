// import 'package:dhuwitku_v2/view/screen/auth/login.dart';
import 'package:dhuwitku_v2/view/screen/user/mainUser.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF25703A),
        scaffoldBackgroundColor: Color(0xFFD6E0D6),
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
      home: UserMain(),
    );
  }
}

class Wrap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
