import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/appColors.dart';
import 'package:quizzy/configs/themes/custom_text_style.dart';
import 'package:quizzy/controllers/question_paper/bring_questions_to_screen.dart';
import 'package:quizzy/firebase_ref/loading_status.dart';
import 'package:quizzy/screens/Questions_after_Clicking_on_subject/test_overview.dart';
import 'package:quizzy/widgets/ComeDowen_timer/come_dowen_timer.dart';
import 'package:quizzy/widgets/Login_button.dart';
import 'package:quizzy/widgets/common/Custom_appBar_question_screen.dart';
import 'package:quizzy/widgets/common/background_decoration_for_Questions_Screen.dart';
import 'package:quizzy/widgets/common/shimer_for_Questions_Screen.dart';
import 'package:quizzy/widgets/content_area.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/answer_card.dart';

class QuestionScreen extends GetView<QuestionsController> {
  const QuestionScreen({super.key});
  static const String routeName = '/questionsscreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
             decoration: const ShapeDecoration(
                shape: StadiumBorder(
                    side: BorderSide(color: onSurfaceTextColor, width: 2))),
            child: Obx(() => CountDowenTimer(time: controller.time.value, color: Colors.white,)),
           
          ),
          showActionIcon: true,
          titleWidget:  Obx(() => Text  (
              "Q . ${(controller.questionIndex.value+1).toString().padLeft(2,'0')}",
                style: AppBarTx,
              ),)
        ),
        body: BackgroundDecoration(
              child: Obx(() => Column(
                    children: [
                      if (controller.loadingStatus.value ==
                          LoadingStatus.loading)
                        const Expanded(
                            child: ContentArea(child: QuestionScreenHolder())),
                      if (controller.loadingStatus.value ==
                          LoadingStatus.completed)
                        Expanded(
                            child: ContentArea(
                          child: SingleChildScrollView(
                            padding: const EdgeInsets.only(top: 45),
                            child: Column(
                              children: [
                                Text(
                                  controller.currentQuestion.value!.question,
                                  style: QuestionText,
                                ),
                                //! to change the state immediately
                                GetBuilder<QuestionsController>(
                                    id: 'answers_list',
                                    builder: (context) {
                                      return ListView.separated(
                                          shrinkWrap: true,
                                          padding:
                                              const EdgeInsets.only(top: 25),
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              ((BuildContext context, index) {
                                            final answer = controller
                                                .currentQuestion
                                                .value!
                                                .answers[index];
                                            return AnswerCard(
                                              answer:
                                                  '${answer.identifier}.${answer.answer}',
                                              onTap: () {
                                                controller.selectedAnswer(answer
                                                    .identifier); // A,B,C choices
                                              },
                                              isSelected: answer.identifier ==
                                                  controller.currentQuestion
                                                      .value!.selectedAnswer,
                                            );
                                          }),
                                          separatorBuilder:
                                              ((BuildContext context,
                                                      int index) =>
                                                  const SizedBox(
                                                    height: 10,
                                                  )),
                                          itemCount: controller.currentQuestion
                                              .value!.answers.length);
                                    }),
                              ],
                            ),
                          ),
                        )),
                      ColoredBox(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        child: Padding(
                          padding: UIParameters.mobileScreenPadding,
                          child: Row(
                            children: [
                              Visibility(
                                visible: controller.isFirstQuestion,
                                child: SizedBox(
                                  width: 55,
                                  height: 55,
                                  child: LogInButton(
                                    onTap: () {
                                      controller.prevQuestion();
                                    },
                                    child: Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Get.isDarkMode
                                          ? onSurfaceTextColor
                                          : Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Visibility(
                                    visible: controller.loadingStatus.value ==
                                        LoadingStatus.completed,
                                    child: LogInButton(
                                      onTap: () {
                                        controller.isLastQuestions
                                        ?  Get.toNamed(testOverView.routeNme)
                                            : controller.nextQuestion();
                                      },
                                      title: controller.isLastQuestions
                                          ? "Complete"
                                          : 'Next',
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  )),
        ));
  }
}
