import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/auth/signin_sceen/login_screen.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_sign_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../build_website/build_website.dart';
import '../content_detail/content_detil.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  File? image;
   File? image2;
  @override
  Future<void> getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery) as PickedFile;
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }
    Future<void> getImageFromGallery2() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery) as PickedFile;
    if (pickedFile != null) {
      setState(() {
        image2 = File(pickedFile.path);
      });
    }
  }

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
                SizedBox(height: MediaQuery.of(context).size.height * 0.10),
                Center(
                    child:
                        SvgPicture.asset('assets/images/Sabki.site (3).svg')),
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
                    children: [
                      Text(
                        "Business Name",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),
                      ),
                      CustomTextFields(
                        hintText: 'Enter Your Business Name',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Website Url",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),
                      ),
                      CustomTextFields(
                        hintText: 'https://www.sabkisite.com/user12',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      //------------------upload Logo------------------
                      Text(
                        "Logo",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child:
                               image==null?   smallCustomButtonEdit(
                                    
                                      onPress: () {
                                        getImageFromGallery();
                                      },
                                      buttonName: 'Choose Logo',
                                      buttonColor: Colors.grey.shade200,
                                      textColor: Colors.black,
                                    ):InkWell(
                                      onTap: (){
                                        getImageFromGallery();
                                      },
                                      child: Image.file(
                                              image!,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                
                            ),
                          )),
                          //------------------- Update Logo Button
                          Expanded(
                              child: Container(
                            child: Center(
                              child: smallCustomButtonEdit(
                                onPress: (){
                                  getImageFromGallery();
                                },
                                buttonName: 'Update Logo',
                                buttonColor: Colors.black,
                                textColor: Colors.white,
                              )
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                   Text(
                        "Logo",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Poppins-Light'),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 100,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                              child:
                               image2==null?   smallCustomButtonEdit(
                                    
                                      onPress: () {
                                        getImageFromGallery2();
                                      },
                                      buttonName: 'Choose Image',
                                      buttonColor: Colors.grey.shade200,
                                      textColor: Colors.black,
                                    ):InkWell(
                                      onTap: (){
                                        getImageFromGallery2();
                                      },
                                      child: Image.file(
                                              image2!,
                                              fit: BoxFit.fill,
                                            ),
                                    ),
                                
                            ),
                          )),
                          //------------------- Update Logo Button
                          Expanded(
                              child: Container(
                            child: Center(
                              child: smallCustomButtonEdit(
                                onPress: (){
                                  getImageFromGallery2();
                                },
                                buttonName: 'Update Image',
                                buttonColor: Colors.black,
                                textColor: Colors.white,
                              )
                            ),
                          ))
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35),
                        child: CustomSignButton(
                          buttonName: 'Next',
                          buttoncolor: Colors.white,
                          textColor: Colors.black,
                          onPress: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ContentDetail()));
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
