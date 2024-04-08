import 'package:get/get.dart';
import 'package:quizzy/Services/firebase_storage_services.dart';
import 'package:quizzy/controllers/auth_controller.dart';
import 'package:quizzy/controllers/theme_controller.dart';

class IntialBinding implements Bindings{ //!From GetX to make the delay from splash screen to introduction screen

  @override
  void dependencies(){
     Get.put(ThemeController());
    Get.put(AuthController(),permanent: true);
    Get.lazyPut(()=>FirebasStorageServices());

  }
}