import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/custom_text_style.dart';
import 'package:quizzy/controllers/question_paper/bring_questions_to_screen.dart';
import 'package:quizzy/controllers/question_paper/quiz_result_controller.dart';
import 'package:quizzy/widgets/Login_button.dart';
import 'package:quizzy/widgets/common/Custom_appBar_question_screen.dart';
import 'package:quizzy/widgets/common/background_decoration_for_Questions_Screen.dart';
import 'package:quizzy/widgets/content_area.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/answer_card.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/checkAnswer_after_finishing.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/check_answer_Card.dart';

class ResultScreen extends GetView<QuestionsController> {
  const ResultScreen({super.key});
  static const String routNmae = '/resultscreen';

  @override
  Widget build(BuildContext context) {
    Color textColor =
        Get.isDarkMode ? Colors.white : Theme.of(context).primaryColor;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          leading: const SizedBox(
            height: 80,
          ),
          title: controller.corretAnswerQuestions,
        ),
        body: BackgroundDecoration(
          child: Column(
            children: [
              Expanded(
                  child: ContentArea(
                      child: Column(
                children: [
                  SvgPicture.asset('assets/images/bulb.svg'),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 5),
                    child: Text(
                      "Congratulations",
                      style: HeaderText.copyWith(color: textColor),
                    ),
                  ),
                  Text(
                    "You have got ${(controller.points)} points",
                    style: TextStyle(color: textColor),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const Text(
                    'Tap below question number to view correct answers',
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          itemCount: controller.allQuestions.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: Get.width ~/ 75,
                            childAspectRatio: 1,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemBuilder: (_, index) {
                            final _question = controller.allQuestions[index];
                            AnswerStatus _status = AnswerStatus.notAnswered;
                            final _selectedAnswer = _question.selectedAnswer;
                            final _correctAnswer = _question.correctAnswer;
                            if (_selectedAnswer == _correctAnswer) {
                              _status = AnswerStatus.correct;
                            } else if (_question.selectedAnswer == null) {
                              _status = AnswerStatus.wrong;
                            } else {
                              _status = AnswerStatus.wrong;
                            }
                            return QuestionNumberCard(
                              index: index + 1,
                              status: _status,
                              onTap: () {
                                controller.jumpToQuestion(index, goBack: false);
                                Get.toNamed(AnswerCheckScreen.routeName);
                              },
                            );
                          }))
                ],
              ))),
              ColoredBox(
                color: Theme.of(context).scaffoldBackgroundColor,
                child: Padding(
                  padding: UIParameters.mobileScreenPadding,
                  child: Row(
                    children: [
                      Expanded(
                        child: LogInButton(
                          onTap: () {
                            controller.tryAgain();
                          },
                          color: Colors.blueGrey,
                          title: 'Try again',
                        ),
                      ),
                      const SizedBox(width: 5,),
                      Expanded(
                        child: LogInButton(
                          onTap: () {
                            controller.saveTestResults();
                          },
                          title: 'Go home',
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
