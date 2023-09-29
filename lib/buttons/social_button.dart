import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final String label;
  // ignore: prefer_typing_uninitialized_variables
  final double horizontalPadding;
  const SocialButton(
      {super.key,
      required this.iconPath,
      required this.label,
      this.horizontalPadding = 100});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
      // ignore: deprecated_member_use
      icon: SvgPicture.asset(
        iconPath,
        color: Colors.black,
        width: 25,
      ),
      label: Text(label,
          style: GoogleFonts.poppins(
              color: Color.fromRGBO(0, 185, 241, 1),
              fontWeight: FontWeight.bold)),
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding:
              EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 30),
          backgroundColor: Colors.white),
    );
  }
}
