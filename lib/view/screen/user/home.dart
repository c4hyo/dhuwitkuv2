import 'package:dhuwitku_v2/view/component/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardTotal(
                judul: "Jumlah Pengeluaran",
                nominal: 100,
              ),
              CardTotal(
                judul: "Jumlah Pemasukan",
                nominal: 500,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          CardJumlah(
            judul: "Pengeluaran",
            nominal: 7000,
          ),
          SizedBox(
            height: 20,
          ),
          CardJumlah(
            judul: "Pemasukan",
            nominal: 7000,
          )
        ],
      ),
    );
  }
}
