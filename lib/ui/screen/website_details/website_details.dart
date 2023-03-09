import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../build_website/build_website.dart';
import '../social_media_details/social_media_details.dart';

class WebsiteDetailScreen extends StatefulWidget {
  const WebsiteDetailScreen({super.key});

  @override
  State<WebsiteDetailScreen> createState() => _WebsiteDetailScreenState();
}

class _WebsiteDetailScreenState extends State<WebsiteDetailScreen> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
            height:MediaQuery.of(context).size.height,
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Center(
                        child:
                        SvgPicture.asset('assets/images/Sabki.site (3).svg')),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                    Text("Website Content",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        )),
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Home Page Heading",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins-Light'),
                            ),
                          ),
                          CustomTextFields(
                            hintText: 'Enter Home Page Heading',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Home Page Sub Heading",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins-Light'),
                            ),
                          ),
                          CustomTextFields(
                            hintText: 'Enter Home Page Sub Heading',
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          //------------------upload Logo------------------
                          Text(
                            "Business Short Description",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins-Light'),
                            ),
                          ),
                          Container(
                            height: 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding:
                              const EdgeInsets.symmetric(
                                  horizontal: 15),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  // filled: true,
                                  // fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText:
                                    "Enter Business Short Description",
                                    hintStyle: TextStyle(color: Color.fromARGB(64, 64, 64, 3))
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Text(
                                "Edit Social Media Details",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins-Light'),
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              Text(
                                "edit",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      fontFamily: 'Poppins-Light'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(children: [
                            Container(
                              child: Center(
                                  child: Image.asset(
                                    'assets/icons/instagram.logo.png',height: 35,)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Center(
                                  child: Image.asset(
                                    'assets/icons/whatsapp.logo.png',height: 35,)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Center(
                                  child:
                                  Image.asset('assets/icons/facebook.logo.png',height: 35,)),
                            ),
                          ]),
                          SizedBox(
                            height: 35,
                          ),
                          Center(
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SocialMediaDetailScreen()));
                              },
                              child: Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Colors.black,
                                ),
                                child: Center(
                                  child: Text(
                                    "Update Profile ",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Poppins-Light')),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class smallCustomButtonEdit extends StatelessWidget {
  final buttonName;
  Color buttonColor;
  Color textColor;
  final onPress;
  smallCustomButtonEdit({
    this.buttonName,
    this.buttonColor = Colors.black,
    this.textColor = Colors.white,
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
          color: buttonColor,
        ),
        child: Center(
          child: Text(
            buttonName,
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins-Light')),
          ),
        ),
      ),
    );
  }
}