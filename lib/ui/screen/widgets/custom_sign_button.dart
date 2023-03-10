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
    this.buttoncolor = Colors.black,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: buttoncolor,
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 172, 171, 171),
                  blurRadius: 8,
                  offset: Offset(0, 6), // Shadow position
                ),
              ],
            ),
            child: Center(
              child: Text(
                buttonName,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: textColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins-Light')),
              ),
            ),
          ),
        ));
  }
}
