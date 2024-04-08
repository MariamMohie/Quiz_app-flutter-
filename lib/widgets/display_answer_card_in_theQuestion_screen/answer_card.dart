import 'package:flutter/material.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/appColors.dart';


enum AnswerStatus{
correct , wrong ,answered ,notAnswered
}



class AnswerCard extends StatelessWidget {
  final String answer;
  final bool isSelected;
  final VoidCallback onTap;
  const AnswerCard(
      {super.key,
      required this.answer,
      this.isSelected = false,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIParameters.cardBorderRadius,
      onTap: onTap,
      child: Ink(
        child: Text(
          answer,
          style: TextStyle(
            color: isSelected ? onSurfaceTextColor : null,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),


        decoration: BoxDecoration(
          borderRadius: UIParameters.cardBorderRadius,
          color: isSelected ? answerSelectedColor(): Theme.of(context).cardColor,
          border: Border.all(color: isSelected?answerSelectedColor():anserBorderColor())
        ),
        
      ),
    );
  }
}


class CorrectAnswer extends StatelessWidget {
  const CorrectAnswer({super.key,required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return  Ink(
      decoration:  BoxDecoration(borderRadius: UIParameters.cardBorderRadius,
      color: correctAnswerColor.withOpacity(0.5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Text(
        answer,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),);
  }
}



class WrongAnswer extends StatelessWidget {
  const WrongAnswer({super.key,required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return  Ink(
      decoration:  BoxDecoration(borderRadius: UIParameters.cardBorderRadius,
      color: wrongAnswerColor.withOpacity(0.5)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Text(
        answer,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
      ),);
  }
}


class NotAnswered extends StatelessWidget {
  const NotAnswered({super.key,required this.answer});
  final String answer;

  @override
  Widget build(BuildContext context) {
    return  Ink(
      decoration:  BoxDecoration(borderRadius: UIParameters.cardBorderRadius,
      color: notAnsweredColor.withOpacity(0.1)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 10),
        child: Text(
        answer,
            style: TextStyle(color: notAnsweredColor, fontWeight: FontWeight.bold),),
      ),);
  }
}