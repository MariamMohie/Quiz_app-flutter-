import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizzy/firebase_ref/refrences.dart';
import 'package:quizzy/screens/LogIn/Login_Options.dart';
import 'package:quizzy/widgets/Dialog/dialogs.dart';

class AuthController extends GetxController {
  @override
  void onReady() {
    //! good when I need new route
    initAuth();
    super.onReady();
  }

  static final FirebaseAuth _auth = FirebaseAuth.instance;
  final _user = Rxn<User>();
  late Stream<User?> _authStateChanges;

  void initAuth() async {
    await Future.delayed(const Duration(seconds: 2));

    _authStateChanges = _auth.authStateChanges();
    _authStateChanges.listen((User? user) {
      _user.value = user;
    });

    navigatetoIntroduction();
  }

  //  static Future<UserCredential> SignInWithGoogle() async {
  //   final GoogleSignIn _googleSignIn = GoogleSignIn();
  
  //   try {
  //     GoogleSignInAccount? account = await _googleSignIn.signIn();
  //     if (account != null) {
  //       final _authAccount = await account.authentication;
  //       final _credential = GoogleAuthProvider.credential(
  //         idToken: _authAccount.idToken,
  //         accessToken: _authAccount.accessToken,
  //       );
  //       await _auth.signInWithCredential(_credential);
  //      // await saveUser(account);
  //     }
  //   } catch (e) {print(e);}
  // }

  static Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  // saveUser(GoogleSignInAccount account) {
  //   userRF.doc(account.email).set({
  //     "email": account.email,
  //     "name": account.displayName,
  //     "profilepic": account.photoUrl
  //   });
  // }

  static Future signInWithEmailAndPassword(String email, String pass) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: pass);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


   static Future signUpWithEmailAndPassword(String email, String pass) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: pass);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  static SignOut() async {
    await _auth.signOut();
    Get.toNamed('/introduction');
  }


  void navigatetoIntroduction() {
    Get.offAllNamed("/introduction");
  }

  void showLoginAlertDialog() {
    Get.dialog(Dialogs.questionStartDialog(onTap: () {
      Get.back();
    navigateToLoginPage();
    }),
    barrierDismissible: false

    
    );
  }
 bool LoggedIn(){
    return _auth.currentUser !=null;
 }

  void navigateToLoginPage(){
Get.toNamed(LogInOptionScreen.routeName);

 }

User? getUser(){
  _user.value= _auth.currentUser;
  return _user.value;
}

 
}
