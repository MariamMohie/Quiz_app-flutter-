import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:quizzy/configs/themes/appColors.dart';

class LogInButton extends StatelessWidget {
  const LogInButton(
      {super.key,
      this.title = '',
      required this.onTap,
      this.enabled = true,
      this.child,
      this.color});

  final String title;
  final VoidCallback onTap;
  final enabled;
  final Widget? child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: SizedBox(
        height: 55,
        child: InkWell(
          onTap: enabled == false ? null : onTap,
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
            color: color?? Theme.of(context).cardColor),
            width: double.maxFinite,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child ??Center(
                child: Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Get.isDarkMode?onSurfaceTextColor:Theme.of(context).primaryColor),
                  ),
              ),
            ),
          )
              
        ),
      ),
    );
  }
}
