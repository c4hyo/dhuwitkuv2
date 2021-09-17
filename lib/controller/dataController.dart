import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:dhuwitku_v2/controller/homeController.dart';
// import 'package:dhuwitku_v2/model/data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DataController extends GetxController {
  final nominal = TextEditingController();
  final judul = TextEditingController();
  final keterangan = TextEditingController();
  final auth = Get.find<AuthController>();
  final home = Get.put(HomeController());
  var jenis = "".obs;
  var loading = false.obs;
  var showInfo = false.obs;
  var filterTanggal = DateFormat('yyyy-MM-dd').format(DateTime.now()).obs;
  final jumlahPemasukan = 0.obs;
  final jumlahPengeluaran = 0.obs;
  final totalPemasukan = 0.obs;
  final totalPengeluaran = 0.obs;

  void clear() {
    jumlahPemasukan.value = 0;
    totalPemasukan.value = 0;
    totalPengeluaran.value = 0;
    jumlahPengeluaran.value = 0;
  }

  Stream<int> getTotalPemasukan() {
    return FirebaseFirestore.instance
        .collection("pengguna")
        .doc(auth.user!.uid)
        .collection("uang")
        .where("jenis", isEqualTo: "pemasukan")
        .snapshots()
        .map(
          (event) => event.docs.length,
        );
  }

  Stream<int> getTotalPengeluaran() {
    return FirebaseFirestore.instance
        .collection("pengguna")
        .doc(auth.user!.uid)
        .collection("uang")
        .where("jenis", isEqualTo: "pengeluaran")
        .snapshots()
        .map(
          (event) => event.docs.length,
        );
  }

  Stream<int> getJumlahPemasukan() {
    return FirebaseFirestore.instance
        .collection("pengguna")
        .doc(auth.user!.uid)
        .collection("uang")
        .where("jenis", isEqualTo: "pemasukan")
        .snapshots()
        .map((event) {
      int total = 0;
      event.docs.forEach((element) {
        total += int.parse(element.data()['nominal'].toString());
      });
      return total;
    });
  }

  Stream<int> getJumlahPengeluaran() {
    return FirebaseFirestore.instance
        .collection("pengguna")
        .doc(auth.user!.uid)
        .collection("uang")
        .where("jenis", isEqualTo: "pengeluaran")
        .snapshots()
        .map(
      (event) {
        int jumlah = 0;
        event.docs.forEach((element) {
          jumlah += int.parse(element.data()['nominal'].toString());
        });
        return jumlah;
      },
    );
  }

  void tampilaKalendar(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 2),
      lastDate: DateTime(DateTime.now().year + 3),
    );
    if (date != null) {
      filterTanggal.value = DateFormat('yyyy-MM-dd').format(date);
    } else {
      filterTanggal.value = DateFormat('yyyy-MM-dd').format(DateTime.now());
    }
  }

  void reset() {
    nominal.clear();
    judul.clear();
    keterangan.clear();
  }

  void create() async {
    if (nominal.text.isEmpty || judul.text.isEmpty) {
      Get.snackbar("Error", "Judul atau nominal tidak boleh kosong");
    }
    if (jenis.value.toLowerCase() == "pilih" || jenis.value.isEmpty) {
      Get.snackbar("error", "Pilih Jenis ");
    }
    loading.value = true;
    try {
      await FirebaseFirestore.instance
          .collection("pengguna")
          .doc(auth.user?.uid)
          .set({
        "nama": auth.user?.displayName,
        "email": auth.user?.email,
      });
      await FirebaseFirestore.instance
          .collection("pengguna")
          .doc(auth.user?.uid)
          .collection("uang")
          .add({
        "judul": judul.text.trim(),
        "keterangan": keterangan.text.trim(),
        "nominal": int.parse(nominal.text.trim()),
        "jenis": jenis.value.toLowerCase(),
        "waktu": DateFormat('yyyy-MM-dd').format(DateTime.now()),
      });
      loading.value = false;
      reset();
      home.indexHalaman.value = 2;
    } catch (e) {
      loading.value = false;
      Get.snackbar("Error", e.toString());
    }
  }

  void updates(String id) async {
    if (nominal.text.isEmpty || judul.text.isEmpty) {
      Get.snackbar("Error", "Judul atau nominal tidak boleh kosong");
    }
    if (jenis.value.toLowerCase() == "pilih" || jenis.value.isEmpty) {
      try {
        loading.value = true;
        await FirebaseFirestore.instance
            .collection("pengguna")
            .doc(auth.user?.uid)
            .collection("uang")
            .doc(id)
            .update({
          "judul": judul.text.trim(),
          "keterangan": keterangan.text.trim(),
          "nominal": int.parse(nominal.text.trim()),
          // "jenis": jenis.value.toLowerCase(),
        });
        loading.value = false;
        reset();
        Get.back();
      } catch (e) {
        loading.value = false;
        Get.snackbar("Error", e.toString());
      }
    } else {
      try {
        loading.value = true;
        await FirebaseFirestore.instance
            .collection("pengguna")
            .doc(auth.user?.uid)
            .collection("uang")
            .doc(id)
            .update({
          "judul": judul.text.trim(),
          "keterangan": keterangan.text.trim(),
          "nominal": int.parse(nominal.text.trim()),
          "jenis": jenis.value.toLowerCase(),
        });
        loading.value = false;
        reset();
        Get.back();
      } catch (e) {
        loading.value = false;
        Get.snackbar("Error", e.toString());
      }
    }
  }

  void delete(String id) async {
    await FirebaseFirestore.instance
        .collection("pengguna")
        .doc(auth.user?.uid)
        .collection("uang")
        .doc(id)
        .delete();
  }

  @override
  void onInit() {
    super.onInit();
    jumlahPemasukan.bindStream(getJumlahPemasukan());
    jumlahPengeluaran.bindStream(getJumlahPengeluaran());
    totalPemasukan.bindStream(getTotalPemasukan());
    totalPengeluaran.bindStream(getTotalPengeluaran());
  }
}
