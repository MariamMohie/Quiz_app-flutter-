import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizzy/controllers/auth_controller.dart';
import 'package:quizzy/controllers/question_paper/bring_questions_to_screen.dart';
import 'package:quizzy/firebase_ref/refrences.dart';

extension QuestionControllerExtention on QuestionsController{

int get correctQuestionCount => allQuestions
.where((element) => element.selectedAnswer == element.correctAnswer)
.toList().length;



String get corretAnswerQuestions{
  return '$correctQuestionCount out of ${allQuestions.length} are Correct';
}


String get points{
  var points =(correctQuestionCount/allQuestions.length)*10;

  //(questionPaperModel.timeSeconds -remainSeconds)/questionPaperModel.timeSeconds*100;

return points.toStringAsFixed(2);
}
 Future <void> saveTestResults() async{
    var batch =fireStore.batch();
    User? user =Get.find<AuthController>().getUser();
    if(user ==null) 
    return;
    batch.set(
      userRF.doc(user.uid).collection('myrecent_tests').doc(questionPaperModel.id),{

        "points":points,
        "correct_answer":'$correctQuestionCount/ ${allQuestions.length}',
        "questionId":questionPaperModel.id,
        "time":questionPaperModel.timeSeconds-remainSeconds
        

      });
      batch.commit();   
      navigateToHome();
  
  }
}