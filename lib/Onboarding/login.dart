import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:garbage_locator/Onboarding/login_field.dart';
import 'package:garbage_locator/Onboarding/signup.dart';
import 'package:garbage_locator/buttons/gradientButton.dart';
import 'package:garbage_locator/buttons/social_button.dart';
import 'package:garbage_locator/controllers/controller.dart';
import 'package:garbage_locator/screens/homePage.dart';
import 'package:garbage_locator/util/utils.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Loginscreen> {
  bool showloading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // CircleAvatar(
            //     backgroundColor: Colors.transparent,
            //     radius: 60,
            //     child: Image.asset(
            //         fit: BoxFit.fill,
            //         alignment: Alignment.center,
            //         'assets/images/logo.png')),
            SizedBox(
              height: 40,
            ),
            Center(
              child: Text('Sign In/Up',
                  style: GoogleFonts.poppins(
                      fontSize: 45, fontWeight: FontWeight.bold)),
            ),
            const SocialButton(
                iconPath: 'assets/icons/g_logo.svg', label: "Google"),
            const SocialButton(
              iconPath: 'assets/icons/f_logo.svg',
              label: "Facebook",
              horizontalPadding: 90,
            ),
            const SizedBox(
              height: 5,
            ),
            const Center(
              child: Text(
                "or",
                style: TextStyle(
                    fontSize: 20, color: Color.fromRGBO(0, 185, 241, 1)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            LoginField(
              textEditingController: Controller.usernamecontroller,
              hint: "Username",
            ),
            const SizedBox(
              height: 10,
            ),
            LoginField(
              textEditingController: Controller.passwordcontroller,
              hint: "Password",
            ),
            const SizedBox(
              height: 10,
            ),
            Gradient_Button(
              button: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: Controller.usernamecontroller.text,
                      password: Controller.passwordcontroller.text);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) {
                      return HomeScreen();
                    },
                  ));
                } on FirebaseAuthException catch (err) {
                  if (err.toString() == "INVALID_LOGIN_CREDENTIALS") {
                    showSnackBar("Incorrect email/password", context);
                  }
                }
              },
              label: "Log In",
              showloading: showloading,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) {
                          Controller.usernamecontroller.clear();
                          Controller.passwordcontroller.clear();
                          return Signup();
                        },
                      ));
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
