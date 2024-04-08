import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/configs/themes/appColors.dart';
import 'package:quizzy/screens/home/homeScreen.dart';
import 'package:quizzy/widgets/app_circle_button.dart';

class AppIntroductionScreen extends StatelessWidget {
  AppIntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        alignment: Alignment.center,
        child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width*0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(
              Icons.star,
              size: 65,
              
            ),
             SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
             Text(
              style:TextStyle(fontSize: 18,color: onSurfaceTextColor,fontWeight: FontWeight.bold),
                "This is a study App .where you Can learn alot .if You Understand Work.with this You will Master what ever You want to know............"),
                 
                  SizedBox(height: MediaQuery.sizeOf(context).height*0.03,),
                 
                 AppCircleButton(child: Icon(Icons.arrow_forward_ios_sharp,size: 50,),onTap: () => Get.offAndToNamed('/Home'),)
          ]),
        ),
      ),
    );
  }
}
