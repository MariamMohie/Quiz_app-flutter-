import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/controllers/question_paper/data_uploader.dart';
import 'package:quizzy/firebase_ref/loading_status.dart';
 
class DataUploaderScreen extends StatelessWidget {
   DataUploaderScreen({super.key});
   DataUploader controller = Get.put(DataUploader()); 
    @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Obx(() => Text(controller.loadingStatus.value==LoadingStatus.completed?"Completed":"uploading......")),
    );
  }
}