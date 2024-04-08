import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quizzy/configs/themes/Ui_parameters.dart';
import 'package:quizzy/configs/themes/appColors.dart';
import 'package:quizzy/controllers/zoom_drawer_controller.dart';

class MenuScreen extends GetView<MyZoomDrawerController> {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 55, top: 15),
      width: double.maxFinite,
      decoration: BoxDecoration(gradient: mainGradient()),
      child: Theme(
          data: ThemeData(
              textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(primary: onSurfaceTextColor))),
          child: SafeArea(
            child: Stack(
              children: [
                Positioned(
                    top: 0,
                    right: 0,
                    child: BackButton(
                      color: Colors.white,
                      onPressed: () {
                        controller.toggleDrawer();
                      },
                    )),
                Padding(
                  padding:  EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05,top: MediaQuery.of(context).size.width*0.1),
                  child: Column(
                    children: [
                      Obx(() => controller.user.value == null
                          ? SizedBox()

                          :  Column(
                            children: [
                              Text(
                                  controller.user.value!.email!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 18,
                                    color: onSurfaceTextColor,
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Text(
                                  controller.user.value!.uid ,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 10,
                                    color: onSurfaceTextColor,
                                  ),
                                ),

                            ],
                          )
                          ),
                           const Spacer(flex: 1,),
                           _DrawerButton(icon: Icons.web, label: 'website',onPressed: ()=> controller.facebook(),),
                          _DrawerButton(icon: Icons.facebook, label: 'facebook',onPressed: ()=> controller.facebook(),),
                          Padding(
                            padding: const EdgeInsets.only(left: 25),
                            child: _DrawerButton(icon: Icons.email, label: 'Email',onPressed: ()=> controller.email(),),
                          ),
                          const Spacer(flex: 4,),
                           _DrawerButton(icon: Icons.logout, label: 'LogOut',onPressed: ()=> controller.SignOut(),),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}



class _DrawerButton extends StatelessWidget {
  const _DrawerButton({super.key,
  required this.icon,
  required this.label,this.onPressed
  });
  final IconData icon;
  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(onPressed: onPressed, icon: Icon(icon,size: 15,), label: Text(label));
  }
}