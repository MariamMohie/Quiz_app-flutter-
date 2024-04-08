import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'package:get/get.dart';
import 'package:quizzy/configs/themes/App_icons.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/appColors.dart';
import 'package:quizzy/configs/themes/custom_text_style.dart';
import 'package:quizzy/controllers/question_paper/questionPaper_controller.dart';
import 'package:quizzy/controllers/zoom_drawer_controller.dart';
import 'package:quizzy/screens/home/menuScreen.dart';
import 'package:quizzy/screens/home/quistion_card.dart';
import 'package:quizzy/widgets/app_circle_button.dart';
import 'package:quizzy/widgets/content_area.dart';

class HomeScreen extends GetView<MyZoomDrawerController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    QuestionPaperController _questionPaperController = Get.find();

    return Scaffold(
      body:GetBuilder<MyZoomDrawerController>(builder: (_){
        return  ZoomDrawer(
          borderRadius: 20.0,
          controller: _.zoomDrawerController,
          showShadow: true,
          angle: 0.0,
      // menuBackgroundColor: Color(0xFF3ac3cb),
          style: DrawerStyle.DefaultStyle,
          backgroundColor: Colors.white.withOpacity(0.5),
          slideWidth: MediaQuery.of(context).size.width*0.6, 
        menuScreen:MenuScreen(),
       
        mainScreen: 
        Container(
          decoration: BoxDecoration(gradient: mainGradient()),
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppCircleButton2
                      (
                        onTap:controller.toggleDrawer ,
                        child: const Icon(
                          Icons.menu_open_rounded,
                          size: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Icon(
                              AppIcon.peace,
                              size: 20,
                            ),
                            Text(
                              "Hello Friend",
                              style:
                                  detailText.copyWith(color: onSurfaceTextColor),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "What do you want to learn \ntoday?",
                          style: HeaderText,
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ContentArea(
                      addPadding: false,
                      child: Obx(() => ListView.separated(
                          padding: UIParameters.mobileScreenPadding,
                          itemBuilder: (BuildContext context, int index) {
                            return Question_card(
                              model: _questionPaperController.allPapers[index],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 20);
                          },
                          itemCount: _questionPaperController.allPapers.length)),
                    ),
                  ),
                ),
              ],
            ),
          )),
      );
      },)
    );
  }
}
