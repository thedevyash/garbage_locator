import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:garbage_locator/Onboarding/login.dart';
import 'package:garbage_locator/components/animated_btn.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rive/rive.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  late RiveAnimationController _btnAnimationController;

  bool isShowSignInDialog = false;

  @override
  void initState() {
    _btnAnimationController = OneShotAnimation(
      "active",
      autoplay: false,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: MediaQuery.of(context).size.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset(
              "assets/images/background/Spline.png",
            ),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
              child: const SizedBox(),
            ),
          ),
          const RiveAnimation.asset(
            "assets/rive/shapes.riv",
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: const SizedBox(),
            ),
          ),
          AnimatedPositioned(
            top: isShowSignInDialog ? -50 : 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            duration: const Duration(milliseconds: 260),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
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
                    SizedBox(
                      width: 260,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/Clean VIT.png",
                              height: 350),
                          Text("Clean VIT",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                  fontSize: 50, fontWeight: FontWeight.bold)),
                          SizedBox(height: 16),
                          Text(
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(),
                            "Navigate a Greener Tomorrow, One Click at a Time.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    AnimatedBtn(
                      btnAnimationController: _btnAnimationController,
                      press: () {
                        _btnAnimationController.isActive = true;

                        Future.delayed(const Duration(milliseconds: 100), () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => Loginscreen()));
                        });
                      },
                    ),
                    SizedBox(
                      height: 26,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
