import 'package:dhuwitku_v2/controller/dataController.dart';
import 'package:dhuwitku_v2/view/component/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Get.find<DataController>();
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardTotal(
                judul: "Jumlah Pengeluaran",
                nominal: data.totalPengeluaran.value,
              ),
              CardTotal(
                judul: "Jumlah Pemasukan",
                nominal: data.totalPemasukan.value,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CardJumlah(
            judul: "Pengeluaran",
            nominal: data.jumlahPengeluaran.value,
          ),
          SizedBox(
            height: 20,
          ),
          CardJumlah(
            judul: "Pemasukan",
            nominal: data.jumlahPemasukan.value,
          )
        ],
      ),
    );
  }
}
