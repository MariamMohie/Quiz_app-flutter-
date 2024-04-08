import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/appColors.dart';
import 'package:quizzy/controllers/auth_controller.dart';
import 'package:quizzy/controllers/question_paper/questionPaper_controller.dart';
import 'package:quizzy/firebase_ref/refrences.dart';
import 'package:quizzy/models/question_paper_model.dart';
import 'package:quizzy/widgets/Login_button.dart';

class LogInOptionScreen extends GetView<AuthController> {
  const LogInOptionScreen({super.key});
 
  static const routeName = '/loginOptions';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/app_splash_logo.png",
              width: 200,
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 60),
              child: Text(
                "this is a study App you can use it to test your knowledge in many sunbjects",
                style: TextStyle(
                    color: onSurfaceTextColor, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            LogInButton(
              onTap: () {
                AuthController.signInWithGoogle();
                
                Get.toNamed("/Home");
              
                

              },
              child: Stack(
                children: [
                  Positioned(
                    top: 0,
                    bottom: 0,
                    left: 0,
                    child: SvgPicture.asset('assets/icons/google.svg'),
                  ),
                  Center(
                      child: Text(
                    "Sign in with Google",
                    style: TextStyle(
                        color: UIParameters.isDarkMode()?Colors.white:Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            LogInButton(
                onTap: () {
                 Get.toNamed('/signIn'); 
                 
                },
                child: Center(
                    child: Text(
                  "SignIn",
                  style: TextStyle(
                      color: UIParameters.isDarkMode()?Colors.white:Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ))),
            SizedBox(
              height: 15,
            ),
            Text(
              "Don't have an account Yet?",
              style: TextStyle(
                  color: onSurfaceTextColor, fontWeight: FontWeight.bold, fontSize: 15),
              textAlign: TextAlign.center,
            ),

            SizedBox(
              height: 30,
            ),
            LogInButton(
                onTap: () {
                  Get.toNamed('login');
                },
                child: Center(
                    child: Text(
                  "SignUp",
                  style: TextStyle(
                      color: UIParameters.isDarkMode()?Colors.white:Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ))),
          ],
        ),
      ),
    );
  }
}
