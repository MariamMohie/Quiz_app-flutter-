import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:quizzy/firebase_ref/loading_status.dart';
import 'package:quizzy/firebase_ref/refrences.dart';
import 'package:quizzy/models/question_paper_model.dart';

//! this place is used to upload data only once
class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
    final loadingStatus= LoadingStatus.loading.obs;//loadingStatus is observable as we use GetX

  Future<void> uploadData() async {

    loadingStatus.value = LoadingStatus.loading;//0

   final fireStore =FirebaseFirestore.instance;

    //! start reading json files

    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    //! decode the content

    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    //! tell the fire which exactly path needed and formating giving it a keys
    //! load json files and print path

    final papersAssets = manifestMap.keys
        .where((Path) =>
            Path.startsWith("assets/DB/paper") && Path.contains(".json"))
        .toList();
    //! read the content now using loop
    List<QuestionPaperModel> questionPapers = [];
    for(var paper in papersAssets){
      String stringPaperContent = await rootBundle.loadString(paper);
      //! decode convert String into Map as fromJson Method only works with Maps
      questionPapers.add(QuestionPaperModel.fromJson(json.decode(stringPaperContent)));
     
    } 
   // print('items nmber ${questionPapers[0].description}');  
   var batch = fireStore.batch();

   //! coming from json files
   for( var paper  in questionPapers){
    //! batch.set(document, data) --> we used paper.id to refer to the whole json file of specific subject
    //* here we created a collection and its documents
    batch.set(questionPaperRF.doc(paper.id), {
      "title" : paper.title,
      "image_url":paper.imageUrl,
      "description":paper.description,
      "time_second":paper.timeSeconds,
      "quistion_count":paper.questions== null?0:paper.questions!.length 
    });
    //* here we will create questions for  each of document
    for(var questions in paper.questions!){
     final questionPath =  questionRF(paperId: paper.id, questionId: questions.id);
     batch.set(questionPath, {
      "question":questions.question,
       "correct_answer":questions.correctAnswer,
     });
     for(var answer in questions.answers){
 batch.set(questionPath.collection("answers").doc(answer.identifier), {
  "identifier":answer.identifier,
  "answer":answer.answer
 });
     }

    }
   }
  
  //! submit the output from this for loop to the firebase
   await batch.commit();
   loadingStatus.value=LoadingStatus.completed;
      }
}
