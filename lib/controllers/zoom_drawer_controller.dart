
import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:quizzy/controllers/auth_controller.dart';
import 'package:url_launcher/url_launcher.dart';


class MyZoomDrawerController extends GetxController{
final zoomDrawerController = ZoomDrawerController();
Rxn<User?> user= Rxn();

@override
  void onReady() {
    user.value= Get.find<AuthController>().getUser();
    super.onReady();
  }
  void toggleDrawer(){
    zoomDrawerController.toggle?.call();
    update();

  }

void SignOut(){
  AuthController.SignOut();

}
void SignIn(){

}
void facebook(){
  _launch("https://www.facebook.com/profile.php?id=100041556766102&mibextid=JRoKGi");

}
void email(){
  final  Uri emailLauncher = Uri(
    scheme: 'mailto',
    path: 'info@Mariam.com',
  );
  _launch(emailLauncher.toString());

}
  Future<void> _launch(String url ) async{
   if( !await  launch (url)){
    throw 'could not launch th $url';
   }

}



}