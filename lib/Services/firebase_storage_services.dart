import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:quizzy/firebase_ref/refrences.dart';



class FirebasStorageServices extends GetxService {
 Future<String?>  getImage(String? imageName) async {
    if (imageName == null) {
      return null;
    }
    try {
     
     
     //! to access the url of image we will take an instance from firebaseStorage
     
     var urlRef=  firebaseStorage.child("question_paper_images").child(
          '${imageName.toLowerCase()}.png'); 
          
          // folder path in firebase there
          //! will return the folder name and image name
   var imgUrl=await urlRef.getDownloadURL();
   return imgUrl;

    } catch (e) {
      return null;
    }
  }
}
