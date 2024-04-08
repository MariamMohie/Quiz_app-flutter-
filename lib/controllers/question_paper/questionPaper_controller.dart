import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:quizzy/Services/firebase_storage_services.dart';
import 'package:quizzy/controllers/auth_controller.dart';
import 'package:quizzy/firebase_ref/refrences.dart';
import 'package:quizzy/models/question_paper_model.dart';
import 'package:quizzy/screens/Questions_after_Clicking_on_subject/QuestionsScreen.dart';

class QuestionPaperController extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers= <QuestionPaperModel>[].obs;
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }

  Future<void> getAllPapers() async {
    List<String> imgName = ["biology", "chemistry", "maths", "physics"];
    try {
      QuerySnapshot<Map<String,dynamic>> data= await questionPaperRF.get();
      final paperList = data.docs.map((paper) => QuestionPaperModel.fromSnapshot(paper)).toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final imgUrl = await Get.find<FirebasStorageServices>().getImage(paper.title);
       paper.imageUrl=imgUrl;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }

  void navigateToQuestions({required QuestionPaperModel paper,bool tryAgain=false}){
    AuthController _authController = Get.find();

    if(_authController.LoggedIn()){
      if(tryAgain){
        Get.back();
      Get.toNamed(QuestionScreen.routeName,arguments: paper);

      }else{
        Get.toNamed(QuestionScreen.routeName,arguments: paper);
      }
    }else{
      _authController.showLoginAlertDialog();
    }
  }
}
