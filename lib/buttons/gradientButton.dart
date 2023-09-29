import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: camel_case_types, must_be_immutable
class Gradient_Button extends StatefulWidget {
  Gradient_Button(
      {super.key,
      required this.label,
      required this.button,
      required this.showloading});
  final String label;
  bool showloading = false;
  Function()? button;
  @override
  State<Gradient_Button> createState() => _Gradient_ButtonState();
}

class _Gradient_ButtonState extends State<Gradient_Button> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(0, 46, 110, 1),
          // gradient:  LinearGradient(
          //     colors: [Pallete.gradient1, Pallete.gradient2, Pallete.gradient3],
          //     begin: Alignment.bottomLeft,
          //     end: Alignment.topRight),
          borderRadius: BorderRadius.circular(10)),
      child: ElevatedButton(
        onPressed: widget.button,
        style: ElevatedButton.styleFrom(
            maximumSize: Size.copy(Size.infinite),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            fixedSize: const Size(300, 40),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent),
        child: widget.showloading
            ? SizedBox(
                height: 13, width: 13, child: CircularProgressIndicator())
            : Text(
                widget.label,
                style: GoogleFonts.poppins(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }
}
