import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:quizzy/controllers/question_paper/bring_questions_to_screen.dart';
import 'package:quizzy/controllers/question_paper/questionPaper_controller.dart';
import 'package:quizzy/controllers/zoom_drawer_controller.dart';
import 'package:quizzy/screens/LogIn/Login_Options.dart';
import 'package:quizzy/screens/LogIn/login_Screen.dart';
import 'package:quizzy/screens/LogIn/signIn.dart';
import 'package:quizzy/screens/Questions_after_Clicking_on_subject/QuestionsScreen.dart';
import 'package:quizzy/screens/Questions_after_Clicking_on_subject/result_screen.dart';
import 'package:quizzy/screens/Questions_after_Clicking_on_subject/test_overview.dart';
import 'package:quizzy/screens/home/homeScreen.dart';
import 'package:quizzy/screens/introduction/introduction.dart';
import 'package:quizzy/screens/splash/splash_screen.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/checkAnswer_after_finishing.dart';

class AppRoutes {
  static List<GetPage> routes() => [
        GetPage(name: "/", page: () => SplashScreen()),
        GetPage(name: "/introduction", page: () => AppIntroductionScreen()),
        GetPage(name: "/Home",
         page:()=>  const HomeScreen(),
         binding: BindingsBuilder((){
          
          Get.put(QuestionPaperController());
          Get.put(MyZoomDrawerController());
         })
        ),

        GetPage(name:"/loginOptions", page:() => LogInOptionScreen()),
        GetPage(name:"/login", page:() => LogInScreen()),
        GetPage(name:QuestionScreen.routeName, page:() => QuestionScreen(),
        binding: BindingsBuilder((){
          Get.put<QuestionsController>(QuestionsController());
        })
        ),

        GetPage(name: testOverView.routeNme, page: ()=>  testOverView()),
          GetPage(name: ResultScreen.routNmae, page: ()=>  ResultScreen()),
           GetPage(name: AnswerCheckScreen.routeName, page: ()=> AnswerCheckScreen()),
 GetPage(name: SignInScreen.routeName, page: ()=>  SignInScreen()),
      ];
}
