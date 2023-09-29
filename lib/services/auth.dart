import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:garbage_locator/screens/homePage.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;
  registerUser(email, password, context) async {
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Registered Successfully")));
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return HomeScreen();
        }));
      });
    } catch (e) {
      print(e.toString());
    }
  }
}
