import 'package:flutter/material.dart';
import 'package:quizzy/configs/themes/custom_text_style.dart';

class CountDowenTimer extends StatelessWidget {
  const CountDowenTimer({
    super.key,
    this.color,
    required this.time
  });
  final Color ?color;

  final String time;

  @override
  Widget build(BuildContext context) {
    return  Row(children: [
      Icon(Icons.timer, color: color??Theme.of(context).primaryColor,size: 15,),
      const SizedBox(width: 5,),
      Text(time,style:  countDowenTimerTs().copyWith(color: color),)

    ],);
  }
}
