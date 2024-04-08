import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:quizzy/configs/themes/custom_text_style.dart';
import 'package:quizzy/controllers/question_paper/bring_questions_to_screen.dart';
import 'package:quizzy/screens/Questions_after_Clicking_on_subject/result_screen.dart';
import 'package:quizzy/widgets/common/Custom_appBar_question_screen.dart';
import 'package:quizzy/widgets/common/background_decoration_for_Questions_Screen.dart';
import 'package:quizzy/widgets/content_area.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/answer_card.dart';

class AnswerCheckScreen extends GetView<QuestionsController> {
  const AnswerCheckScreen({super.key});
  static String routeName = "/answercheckscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
          titleWidget: Obx(
        () => Text(
          'Q . ${(controller.questionIndex.value + 1).toString().padLeft(2, "0")}',
          style: AppBarTx,
        ),
        
      ),
      showActionIcon: true,
      onMenuActionTap: () {
        Get.toNamed(ResultScreen.routNmae);

      },
      ),

      body: BackgroundDecoration(child: Obx(() => Column(children: [
        Expanded(child: ContentArea(child: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 20),
          child: Column(children: [
            Text(controller.currentQuestion.value!.question),
            GetBuilder <QuestionsController>(
              id :"answer_review_list",
              builder: (_){
            return ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.currentQuestion.value!.answers.length,
                itemBuilder: (_,index){

                   final answer =controller.currentQuestion.value!.answers[index];
                   final selectedAnswer = controller.currentQuestion.value!.selectedAnswer;
                  final correctAnswer = controller.currentQuestion.value!.correctAnswer;
                  final String answerText ='${answer.identifier}.${answer.answer}';


                    if(correctAnswer == selectedAnswer && answer.identifier == selectedAnswer){
                       return CorrectAnswer(answer: answerText);

                    }
                    else if(selectedAnswer==null){
                      
                     return NotAnswered(answer: answerText);
                    }

                    else if( correctAnswer != selectedAnswer && answer.identifier == selectedAnswer){
                      return WrongAnswer(answer: answerText);

                    }
                    else if(correctAnswer == answer.identifier){
                      return CorrectAnswer(answer: answerText);
                      
                    }
                    return AnswerCard(answer: answerText, onTap: (){}, isSelected:  false,);


                   

                },
             separatorBuilder: (_,index){
              return const SizedBox(height: 10,);
             },
            );
            })
          ],),
        )))
      ],))),
    );
  }
}
