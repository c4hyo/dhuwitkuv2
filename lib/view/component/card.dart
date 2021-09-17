import 'package:dhuwitku_v2/model/data.dart';
import 'package:dhuwitku_v2/view/screen/user/detailKeuangan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardTotal extends StatelessWidget {
  final String? judul;
  final int? nominal;
  CardTotal({this.judul, this.nominal});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 4,
      width: Get.width / 2.25,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(2, 0),
          ),
        ],
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "$nominal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          Text(
            "$judul",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CardJumlah extends StatelessWidget {
  final String? judul;
  final int? nominal;
  CardJumlah({this.judul, this.nominal});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 4,
      width: Get.width / 1.1,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(2, 0),
          ),
        ],
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Rp. $nominal",
            style: TextStyle(
              color: Colors.white,
              fontSize: 40,
            ),
          ),
          Text(
            "$judul",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final DataModel? dataModel;
  CardList({this.dataModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.width / 4,
      width: Get.width / 1.1,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 1,
            offset: Offset(2, 0),
          ),
        ],
        color: (dataModel!.jenis == "pemasukan")
            ? Get.theme.primaryColor
            : Get.theme.primaryColor.withRed(220),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            flex: 8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rp. ${dataModel!.nominal}",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                Text(
                  "${dataModel!.judul}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: () {
                Get.to(() => EditKeuanganScreen(), arguments: {
                  "data": dataModel,
                });
              },
              child: Icon(
                Icons.loupe,
                size: 45,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
