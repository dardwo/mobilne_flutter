import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController{
  @override
  void onReady() {
    uploadData();

    super.onReady();
  }

  void uploadData() async {
    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json and print path
    final papersInAssets = manifestMap.keys.where((path) => path.startsWith("assets/DB/paper")&&path.contains(".json")).toList();
    //rootBundle "assets" contains the resources that were packaged with the application when it was built.
    for(var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      print(stringPaperContent);
    }
  }
}