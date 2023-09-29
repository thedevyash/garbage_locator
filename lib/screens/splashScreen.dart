import 'dart:math';

import 'package:flutter/material.dart';
import 'package:garbage_locator/services/splash_servic.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  List<String> images = [];
  @override
  void initState() {
    splashservices splashservice = splashservices();
    // TODO: implement initState
    super.initState();

    splashservice.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: Future.delayed(Duration(seconds: 0)),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            return Image(
              image: NetworkImage(
                  "https://imgs.search.brave.com/in0IL5zVdulcfTgtcpDgMi8X7pYL0vt1XqBeWfvfWHU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9pbWFn/ZXMudW5zcGxhc2gu/Y29tL3Bob3RvLTE1/Mjg0NTk4MDE0MTYt/YTllNTNiYmY0ZTE3/P2l4bGliPXJiLTQu/MC4zJml4aWQ9TTN3/eE1qQTNmREI4TUh4/elpXRnlZMmg4Tm54/OGMzQnNZWE5vSlRJ/d2MyTnlaV1Z1ZkdW/dWZEQjhmREI4Zkh3/dyZ3PTEwMDAmcT04/MA"),
              height: double.infinity,
              fit: BoxFit.fitHeight,
            );
          },
        ),
      ),
    );
  }
}
