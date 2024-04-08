import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:quizzy/controllers/auth_controller.dart';
import 'package:quizzy/controllers/question_paper/questionPaper_controller.dart';
import 'package:quizzy/firebase_ref/loading_status.dart';
import 'package:quizzy/firebase_ref/refrences.dart';
import 'package:quizzy/models/question_paper_model.dart';
import 'package:quizzy/screens/Questions_after_Clicking_on_subject/result_screen.dart';
import 'package:quizzy/screens/home/homeScreen.dart';

class QuestionsController extends GetxController {
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  final loadingStatus = LoadingStatus.loading.obs;
  //! reactive variable
  Rxn<Questions> currentQuestion = Rxn<Questions>();
  final questionIndex = 0.obs;
  // create a getter  to check this not the first question
  bool get isFirstQuestion => questionIndex.value > 0;
  bool get isLastQuestions => questionIndex.value >= allQuestions.length - 1;
  Timer? _timer;
  int remainSeconds = 0;
  final time = '00.00'.obs; //obs to be reactive

  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    //print(_questionPaper.title);

    LoadData(_questionPaper);
    super.onReady();
  }

  Future<void> LoadData(QuestionPaperModel questionPaper) async {
    loadingStatus.value = LoadingStatus.loading;
    questionPaperModel = questionPaper;
    try {
      final QuerySnapshot<Map<String, dynamic>> questionQuery =
          await questionPaperRF
              .doc(questionPaper.id)
              .collection("questions")
              .get();

      final questions = questionQuery.docs
          .map((snapShot) => Questions.fromSnapshot(snapShot))
          .toList();

      questionPaper.questions = questions;

      for (Questions _question in questionPaper.questions!) {
        final QuerySnapshot<Map<String, dynamic>> answersQuery =
            await questionPaperRF
                .doc(questionPaper.id)
                .collection("questions")
                .doc(_question.id)
                .collection("answers")
                .get();
        final answers = answersQuery.docs
            .map((answer) => Answers.fromSnapshot(answer))
            .toList();
        _question.answers = answers;

      
      }
    } catch (e) {
      print(e.toString());
    }

      if (questionPaper.questions != null &&
            questionPaper.questions!.isNotEmpty) {
          allQuestions.assignAll(questionPaper.questions!);
          currentQuestion.value = questionPaper.questions![0];
          _startTimer(questionPaper.timeSeconds);

          // print(questionPaper.questions![0].question);
          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
  }

  void selectedAnswer(String? answer) {
    currentQuestion.value!.selectedAnswer = answer;
    update(['answers_list']);
  }

     String get completedTest {
      final answered = allQuestions.where((element) =>
       element.selectedAnswer !=null)
       .toList().length;
         return  '$answered out of ${allQuestions.length} answered';
  }


  void jumpToQuestion( int index ,{bool goBack= true}){
    questionIndex.value =index;
    currentQuestion .value = allQuestions[index];
    if(goBack){
      Get.back();
    }

  }

  void nextQuestion() {
    if (questionIndex.value >= allQuestions.length - 1) return;
    questionIndex.value++;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  void prevQuestion() {
    if (questionIndex.value <= 0) return;
    questionIndex.value--;
    currentQuestion.value = allQuestions[questionIndex.value];
  }

  _startTimer(int seconds) {
    //15
    const duration = Duration(seconds: 1);
    remainSeconds = seconds;
    _timer= Timer.periodic(duration, (Timer timer) {
      if (remainSeconds == 0)
        timer.cancel();
      else {
        int minutes = remainSeconds ~/ 60;
        int seconds = remainSeconds % 60;
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainSeconds--;
      }
    });
  }


  void complete(){
    _timer!.cancel();
    Get.offAndToNamed(ResultScreen.routNmae);
  }


  void tryAgain(){
    Get.find<QuestionPaperController>().navigateToQuestions(
      paper:questionPaperModel 
    ,tryAgain: true);
 
  }
  void navigateToHome(){
    _timer!.cancel();
    Get.offNamedUntil('/Home', (route) => false); //start every thing from begining
  }

 
}
