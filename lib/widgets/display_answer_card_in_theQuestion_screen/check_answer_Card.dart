import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/appColors.dart';
import 'package:quizzy/widgets/display_answer_card_in_theQuestion_screen/answer_card.dart';

class QuestionNumberCard extends StatelessWidget {
  const QuestionNumberCard(
      {super.key,
      required this.index,
      required this.status,
      required this.onTap});
  final int index;
  final AnswerStatus? status;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    Color _backgroundColor = Theme.of(context).primaryColor;
    switch (status) {
      case AnswerStatus.answered:
        _backgroundColor:
        Get.isDarkMode
            ? Theme.of(context).cardColor
            : Theme.of(context).primaryColor;
        break;

      case AnswerStatus.correct:
        _backgroundColor = correctAnswerColor;
        break;

      case AnswerStatus.wrong:
        _backgroundColor = wrongAnswerColor;

        break;

      case AnswerStatus.notAnswered:
        _backgroundColor = Get.isDarkMode
            ? Colors.red.withOpacity(0.5)
            : Theme.of(context).primaryColor.withOpacity(0.1);

        break;

      default:
        _backgroundColor = Theme.of(context).primaryColor.withOpacity(0.1);
    }
    return InkWell(
      onTap: onTap,
      borderRadius: UIParameters.cardBorderRadius,
      child: Ink(
          child: Center(
        child: Text(
          '$index',
          style: TextStyle(
              color: status == AnswerStatus.notAnswered
                  ? Theme.of(context).primaryColor
                  : null),
        ),
      
      ),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(color: _backgroundColor,
      borderRadius: UIParameters.cardBorderRadius,
      ),
      
      
      ),
    );
  }
}
