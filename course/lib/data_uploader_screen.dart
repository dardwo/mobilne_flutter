import 'package:course/controllers/question_paper/data_uploader.dart';
import 'package:course/firebase_ref/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({super.key});
  DataUploader controller = Get.put(DataUploader());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Obx(() => Text(controller.loadingStatus.value==LoadingStatus.completed? "Uploading completed":
      "Uploading...")))
    );
  }
}