import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomSignButton extends StatelessWidget {
  final buttonName;
  final onPress;
  Color buttoncolor;
  Color textColor;
   CustomSignButton({
    super.key,
    this.buttonName,
    this.onPress,
   this.buttoncolor=Colors.black,
   this.textColor=Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: buttoncolor,
            ),
            child: Center(
              child: Text(
                buttonName,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: textColor,
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins-Light')),
              ),
            ),
          ),
        ));
  }
}