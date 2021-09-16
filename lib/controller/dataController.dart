import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  var jenis = "".obs;
  final nominal = TextEditingController();
  final judul = TextEditingController();
  final keterangan = TextEditingController();

  void simpan() {
    if (jenis.value.toLowerCase() == "pilih" || jenis.value.isEmpty) {
      Get.snackbar("error", "Pilih Jenis ");
    }
  }
}
