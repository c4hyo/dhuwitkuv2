import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhuwitku_v2/controller/authController.dart';
import 'package:dhuwitku_v2/controller/dataController.dart';
import 'package:dhuwitku_v2/model/data.dart';
import 'package:dhuwitku_v2/view/component/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ListKeuangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Get.find<AuthController>();
    final data = Get.find<DataController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              data.tampilaKalendar(context);
            },
            icon: Icon(
              Icons.calendar_today_outlined,
              color: Get.theme.primaryColor,
            ),
          )
        ],
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 5,
        title: Text(
          "Beranda",
          style: TextStyle(
            color: Get.theme.primaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => SafeArea(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection("pengguna")
                .doc(auth.user?.uid)
                .collection("uang")
                .where("waktu", isEqualTo: data.filterTanggal.value)
                .snapshots(),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return ListView.builder(
                itemCount: snapshot.data!.docs.length + 1,
                itemBuilder: (_, index) {
                  if (index == 0) {
                    return Obx(
                      () => Padding(
                        padding: EdgeInsets.all(10),
                        child: (data.showInfo.isTrue)
                            ? Card(
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Informasi",
                                            style: TextStyle(
                                              fontSize: 17,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () =>
                                                data.showInfo.toggle(),
                                            icon: Icon(
                                              Icons.cancel_outlined,
                                              color: Get.theme.primaryColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 10,
                                            height: Get.width / 10,
                                            color: Get.theme.primaryColor,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text("Pemasukan"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 10,
                                            height: Get.width / 10,
                                            color: Get.theme.primaryColor
                                                .withRed(220),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text("Pengeluaran"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Text("Filter tanggal: "),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 8.0),
                                            child: Obx(
                                              () => Text(
                                                  "${DateFormat('dd MMMM yyyy').format(
                                                DateTime.parse(
                                                    data.filterTanggal.value),
                                              )}"),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : Center(
                                child: GestureDetector(
                                  onTap: () => data.showInfo.toggle(),
                                  child: Container(
                                    child: Row(
                                      children: [
                                        Icon(Icons.info_outline),
                                        Padding(
                                          padding: EdgeInsets.only(left: 8.0),
                                          child: Text("Informasi"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                      ),
                    );
                  }
                  DocumentSnapshot doc = snapshot.data!.docs[index - 1];
                  DataModel datas = DataModel.fromMap(doc);
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: CardList(
                      dataModel: datas,
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
