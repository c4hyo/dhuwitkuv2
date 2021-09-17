import 'package:dhuwitku_v2/controller/dataController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditKeuanganScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Get.put(DataController());
    data.nominal.text = Get.arguments['data'].nominal.toString();
    data.judul.text = Get.arguments['data'].judul.toString();
    data.keterangan.text = Get.arguments['data'].keterangan.toString();
    data.jenis.value = Get.arguments['data'].jenis;
    List<String> jenisList = [
      "Pemasukan",
      "Pengeluaran",
    ];
    String? jenis;

    return GetBuilder<DataController>(
      init: Get.find<DataController>(),
      dispose: (_) {
        data.reset();
      },
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {
                  data.delete(Get.arguments['data'].id);
                  Get.back();
                  Get.back();
                  data.reset();
                },
                icon: Icon(Icons.delete_outline),
              )
            ],
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: Get.width / 2.5,
                    width: Get.width,
                    color: Get.theme.primaryColor,
                    child: Center(
                      child: Text(
                        "Ubah\n Pengeluaran atau Pemasukan",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: data.nominal,
                      keyboardType: TextInputType.number,
                      cursorColor: Get.theme.primaryColor,
                      decoration: InputDecoration(
                        hintText: "Nominal",
                        hintStyle: TextStyle(
                          color: Get.theme.primaryColor,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: data.judul,
                      cursorColor: Get.theme.primaryColor,
                      decoration: InputDecoration(
                        hintText: "Judul",
                        hintStyle: TextStyle(
                          color: Get.theme.primaryColor,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: DropdownButtonFormField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: InputBorder.none,
                      ),
                      hint: Text("${data.jenis.value}"),
                      style: TextStyle(
                        color: Get.theme.primaryColor,
                      ),
                      value: jenis,
                      onChanged: (newValue) {
                        data.jenis.value = newValue.toString();
                      },
                      items: jenisList.map((location) {
                        return DropdownMenuItem(
                          child: new Text(location),
                          value: location,
                        );
                      }).toList(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      maxLines: null,
                      controller: data.keterangan,
                      cursorColor: Get.theme.primaryColor,
                      decoration: InputDecoration(
                        hintText: "Keterangan",
                        hintStyle: TextStyle(
                          color: Get.theme.primaryColor,
                        ),
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Obx(
                      () => (data.loading.isTrue)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Get.theme.primaryColor,
                                fixedSize:
                                    Size(Get.width / 1.5, Get.height / 18),
                              ),
                              child: Text("Ubah"),
                              onPressed: () {
                                data.updates(Get.arguments['data'].id);
                              },
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
