import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/custom_text_style.dart';
import 'package:quizzy/controllers/question_paper/bring_questions_to_screen.dart';
import 'package:quizzy/widgets/ComeDowen_timer/come_dowen_timer.dart';
import 'package:quizzy/widgets/Login_button.dart';
import 'package:quizzy/widgets/common/Custom_appBar_question_screen.dart';
import 'package:quizzy/widgets/common/background_decoration_for_Questions_Screen.dart';
import 'package:quizzy/widgets/content_area.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/answer_card.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/check_answer_Card.dart';

class testOverView extends GetView<QuestionsController> {
  const testOverView({super.key});

  static const String routeNme = "/testoverview";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        title: controller.completedTest,
      ),
      body: BackgroundDecoration(
          child: Column(
        children: [
          Expanded(
              child: ContentArea(
                  child: Column(
            children: [
              Row(
                children: [
                  CountDowenTimer(
                      time: "",
                      color: UIParameters.isDarkMode()
                          ? Theme.of(context).textTheme.bodyMedium!.color
                          : Theme.of(context).primaryColor),
                  Obx(
                    () => Text(
                      '${controller.time} Remaining',
                      style: countDowenTimerTs(),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: GridView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: controller.allQuestions.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: Get.width ~/ 75,
                    childAspectRatio: 1,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemBuilder: (_, index) {
                  AnswerStatus? _answerstatus;
                  if (controller.allQuestions[index].selectedAnswer != null) {
                    _answerstatus = AnswerStatus.answered;
                  }
                  return QuestionNumberCard(
                      index: index + 1,
                      status: _answerstatus,
                      onTap: () => controller.jumpToQuestion(index));
                },
              ))
            ],
          ))
          ),
          ColoredBox(color: Theme.of(context).scaffoldBackgroundColor,
          child: Padding(padding: UIParameters.mobileScreenPadding,
          child:  LogInButton(onTap: () {
            controller.complete();
            
          }, title: 'Complete',),
          
          ),
          )

        ],
      )),
    );
  }
}
