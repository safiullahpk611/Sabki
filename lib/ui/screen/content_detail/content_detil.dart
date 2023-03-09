import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/auth/signin_sceen/login_screen.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_sign_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../build_website/build_website.dart';
import '../website_details/website_details.dart';

class ContentDetail extends StatelessWidget {
  const ContentDetail({super.key});

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Column(children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                Center(
                    child: SvgPicture.asset('assets/images/Sabki.site (3).svg',
                    width:  100,
                    ),
                    
                    ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                Text("Content Detail",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Poppins-Light'),
                    )),
              ]),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Contact Person",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),
                      ),
                      CustomTextFields(
                        hintText: 'Dropdown (Owner, Proprietor, Manager',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Name of (Dropdown result)",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),
                      ),
                      CustomTextFields(
                        hintText: 'Type here',
                      ),
                       SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Mobile No",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),),
                        CustomTextFields(
                        hintText: 'Enter here your Mobile No',
                      ),
                       SizedBox(
                        height: 15,
                      ),
                        Text(
                        "Secondly Mobile No",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),),
                        CustomTextFields(
                        hintText: 'Enter here your Secondly Mobile No',
                      ),
                          SizedBox(
                        height: 15,
                      ),
                        Text(
                        "Email ID",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),),
                        CustomTextFields(
                        hintText: 'Enter here your Email ID',
                      ),
                        SizedBox(
                        height: 15,
                      ),
                        Text(
                        "Secondly Email ID",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),),
                        CustomTextFields(
                        hintText: 'Enter here your Secondly Email ID',
                      ),
                         SizedBox(
                        height: 15,
                      ),
                        Text(
                        "Address",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),),
                        CustomTextFields(
                        hintText: 'Enter here your Address',
                      ),
                         SizedBox(
                        height: 15,
                      ),
                        Text(
                        "Map Location",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),),
                        CustomTextFields(
                        hintText: 'Select Map Location',
                      ),
                      //------------------upload Logo------------------
                    
                      SizedBox(height: 40,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: CustomSignButton(buttonName: 'Next',
                        buttoncolor: Colors.white,
                        textColor: Colors.black,
                          onPress: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WebsiteDetailScreen()));
                          },
                        ),
                      ),
                        SizedBox(height: 20,),
                      
                    ]),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class smallCustomButtom extends StatelessWidget {
  final buttonName;
  Color buttonColor;
  Color textColor;
  final onPress;
 smallCustomButtom({
    this.buttonName,
    this.buttonColor=Colors.black,
        this.textColor=Colors.white,
        this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: 40,
        width: 110,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: buttonName,
        ),
        child: Center(
          child: 
            buttonName
          
          ),
        ),
      
    );
  }
}
