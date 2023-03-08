import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../website_detail_screen/website_detail_screen.dart';
import '../build_website/build_website.dart';
import '../widgets/custom_sign_button.dart';

class SocialMediaDetailScreen extends StatefulWidget {
  const SocialMediaDetailScreen({super.key});

  @override
  State<SocialMediaDetailScreen> createState() => _SocialMediaDetailScreenState();
}

class _SocialMediaDetailScreenState extends State<SocialMediaDetailScreen> {

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
                    Text("Social Media Detials",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        )),
                  ]),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Container(
                            child: Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),

                                /// Instagram Textfield
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 15),
                                  child: Text(
                                    "Instagram",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontFamily:
                                            'Poppins-Light')),
                                  ),
                                ),
                                CustomTextFields(
                                    hintText:
                                    "Enter your Instagram URL"),

                                /// Facebook Textfield
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 15),
                                  child: Text(
                                    "Facebook",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontFamily:
                                            'Poppins-Light')),
                                  ),
                                ),
                                CustomTextFields(
                                    hintText:
                                    "Enter your Facebook URL"),

                                /// Twitter Textfield
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 15),
                                  child: Text(
                                    "Twitter",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontFamily:
                                            'Poppins-Light')),
                                  ),
                                ),
                                CustomTextFields(
                                    hintText:
                                    "Enter your Twitter URL"),

                                /// Youtube Textfield
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 15),
                                  child: Text(
                                    "Youtube",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontFamily:
                                            'Poppins-Light')),
                                  ),
                                ),
                                CustomTextFields(
                                    hintText:
                                    "Enter your Youtube URL"),

                                /// Whatsapp Textfield
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.only(
                                      left: 15),
                                  child: Text(
                                    "Whatsapp",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                            FontWeight.w500,
                                            fontFamily:
                                            'Poppins-Light')),
                                  ),
                                ),
                                CustomTextFields(
                                    hintText:
                                    "Enter your Whatsapp URL"),
                                SizedBox(
                                  height: 20,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(
                            height: 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: CustomSignButton(
                              buttonName: 'Save',
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
