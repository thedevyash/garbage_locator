import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_locator/Onboarding/login.dart';
import 'package:garbage_locator/Onboarding/onBoardingScreen.dart';
import 'package:garbage_locator/screens/homePage.dart';

import 'dart:async';

class splashservices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if (user != null) {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => HomeScreen()))));
    } else {
      Timer(
          Duration(seconds: 2),
          () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: ((context) => OnbordingScreen()))));
    }
  }
}
