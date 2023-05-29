import 'dart:convert';
import 'package:courseapp/models/question_paper_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:_flutterfire_internals/_flutterfire_internals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DataUploader extends GetxController{
  @override
  void onReady() {
    uploadData();

    super.onReady();
  }

  Future<void> uploadData() async {
    final fireStore = FirebaseFirestore.instance;

    final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //load json and print path
    final papersInAssets = manifestMap.keys.where((path) => path.startsWith("assets/DB/paper")&&path.contains(".json")).toList();
    //rootBundle "assets" contains the resources that were packaged with the application when it was built.
    List<QuestionPaperModel> questionPapers = [];
    for(var paper in papersInAssets) {
      String stringPaperContent = await rootBundle.loadString(paper);
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
    }
    //print('Items numer ${questionPapers[0].description}');
    var batch = fireStore.batch();
  }
}