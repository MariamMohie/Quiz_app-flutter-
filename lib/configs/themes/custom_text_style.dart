
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/appColors.dart';

TextStyle cardTitle (context)=> 
   TextStyle(
                      color: UIParameters.isDarkMode()?Theme.of(context).textTheme.bodyMedium!.color
                      :Theme.of(context).primaryColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    );

                    const QuestionText =TextStyle(fontSize: 16,fontWeight: FontWeight.w800);

                    const detailText =TextStyle(fontSize: 12);
                    const HeaderText =TextStyle(fontSize: 22,fontWeight: FontWeight.w700,
                    color: onSurfaceTextColor);

                    const AppBarTx =TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: onSurfaceTextColor);

                    TextStyle countDowenTimerTs ()=> TextStyle(letterSpacing: 2,color: UIParameters.isDarkMode()?Theme.of(Get.context!).textTheme.bodyMedium?.color:Theme.of(Get.context!).primaryColor);
                    
