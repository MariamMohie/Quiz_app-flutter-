import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizzy/configs/themes/appColors.dart';
import 'package:quizzy/screens/LogIn/signIn.dart';
import 'package:quizzy/screens/home/homeScreen.dart';

import '../../controllers/auth_controller.dart';

// import 'package:project1/Amazon/home%20screen.dart';
// import 'package:project1/Amazon/signup.dart';
// import 'package:project1/Amazon/themes.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? Key}) : super(key: Key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // solve for overflow
      body: Container(
        decoration: BoxDecoration(gradient: mainGradient()),
        child: Column(
          children: [
            SizedBox(height: 60),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Theme.of(context).primaryColor,
                    ))
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Sign Up",
                  style: GoogleFonts.anton(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 50),
                ),
              ],
            ),
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Text(
                  "To new Account",
                  style: GoogleFonts.anton(
                      color:Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40),
                ),
              ],
            ),
            SizedBox(height: 15),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(
                  hintText: "Enter Your Email",
                  labelText: "Your Email",
                  labelStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                      weight: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                controller: passcontroller,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  labelText: "Your Password",
                  labelStyle: TextStyle(color:Colors.white),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                  prefixIcon: Icon(
                    Icons.password,
                    color: Colors.white,
                  ),
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.clear,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            GestureDetector(
              onTap: () {
                AuthController.signUpWithEmailAndPassword(
                    emailcontroller.text.trim(), passcontroller.text.trim());
                 Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomeScreen()));
              },
              child: Container(
                width: 300,
                height: 40,
                child: Center(
                    child: Text(
                      "SignUp",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    )),
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(10),
                    border:
                    Border.all(width: 3, color: Theme.of(context).primaryColor)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
           
            
            Row(
              children: [
                SizedBox(width: 50),
                Text(
                  "Already have an account?",
                  style:
                  TextStyle(color: Colors.white, fontSize: 15,fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 5),
                TextButton(
                    onPressed: () {
                     Navigator.push(context,
                         MaterialPageRoute(builder: (context) => SignInScreen()));
                    },
                    child: Text(
                      "SignIn",
                      style: TextStyle(
                          color:Color(0xFF3ac3cb),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
