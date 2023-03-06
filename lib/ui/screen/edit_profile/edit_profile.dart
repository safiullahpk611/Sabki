import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/auth/signin_sceen/login_screen.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../build_website/build_website.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper (4).png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.1), BlendMode.dstATop),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.10),
              Center(
                  child: SvgPicture.asset('assets/images/Sabki.site (3).svg')),
              SizedBox(height: MediaQuery.of(context).size.height * 0.07),
              Text("Edit profile",
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins-Light'),
                  )),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text("Business Name"),
              SizedBox(height: 10,),
              CustomTextFields(hintText: 'Enter Your Business Name',)
              
              ]),
            )
          ],
        ),
      ),
    ));
  }
}
