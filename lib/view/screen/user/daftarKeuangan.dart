import 'package:dhuwitku_v2/view/component/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListKeuangan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Get.theme.scaffoldBackgroundColor,
        elevation: 5,
        title: TextFormField(
          decoration: InputDecoration(
            hintText: "Pencarian",
            hintStyle: TextStyle(
              color: Get.theme.primaryColor,
            ),
            filled: true,
            suffixIcon: Icon(
              Icons.search_outlined,
              color: Get.theme.primaryColor,
            ),
            fillColor: Get.theme.scaffoldBackgroundColor,
            border: InputBorder.none,
          ),
        ),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, index) {
            return Padding(
              padding: EdgeInsets.all(10),
              child: CardList(),
            );
          },
        ),
      ),
    );
  }
}
