import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizzy/configs/themes/App_icons.dart';
import 'package:quizzy/configs/themes/custom_text_style.dart';
import 'package:quizzy/widgets/app_circle_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      this.title = '',
      this.showActionIcon = false,
      this.leading,
      this.onMenuActionTap,
      this.titleWidget});

  final String title;
  final Widget? titleWidget;
  final Widget? leading;
  final bool showActionIcon;
  final VoidCallback? onMenuActionTap;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Stack(
      children: [
        Positioned.fill(
            child: titleWidget == null
                ? Center(
                    child: Text(
                      title,
                      style: AppBarTx,
                    ),
                  )
                : Center(
                    child: titleWidget,
                  )),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leading ??
                  Transform.translate(
                   offset: const Offset(-14, 0),
                    child: const BackButton(),
                  ),
          
                  if(showActionIcon)
                  Transform.translate(offset: const Offset(10, 0),child: AppCircleButton2(
                    child: Icon(AppIcon.menu),
                    onTap:  onMenuActionTap?? ()=> Get.toNamed("/testoverview"),
                    ))
            ],
          ),
        ),
      ],
    ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size(double.infinity, 60);
}
