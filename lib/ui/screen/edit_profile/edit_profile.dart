import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/enums/view_state.dart';
import 'package:flutter_login_ui/ui/screen/auth/signin_sceen/login_screen.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_sign_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../auth/signin_sceen/loginProvider.dart';
import '../build_website/build_website.dart';
import '../build_website/build_website_provider.dart';
import '../content_detail/content_detil.dart';
import 'package:image_picker/image_picker.dart';

import '../widgets/text_field.dart';
import 'edit_profile_provider.dart';

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
    return ChangeNotifierProvider(create: (context) {
      return EditProfileProvider();
    }, child: Consumer<EditProfileProvider>(builder: (context, model, child) {
      return Scaffold(
          body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Colors.blue,
        ),
        inAsyncCall: model.state == ViewState.busy,
        child: SafeArea(
          child: Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    Center(
                        child: SvgPicture.asset(
                            'assets/images/Sabki.site (3).svg')),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
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
                            onPress: (Value) {
                              model.appUser.businessName = Value;
                            },
                            controller: model.businessNameController,
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
                            onPress: (Value) {
                              model.appUser.websiteUrl = Value;
                            },
                            controller: model.websiteUrlController,
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
                                height: 130,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: model.image == null
                                      ? smallCustomButtonEdit(
                                          onPress: () {
                                            model.getImage();
                                          },
                                          buttonName: 'Choose Logo',
                                          buttonColor: Colors.grey.shade200,
                                          textColor: Colors.black,
                                        )
                                      : InkWell(
                                          onTap: () {
                                            model.getImage();
                                          },
                                          child: Image.file(
                                            model.image!,
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
                                  onPress: () {
                                    model.UploadImage();
                                  },
                                  buttonName: 'Update Logo',
                                  buttonColor: Colors.black,
                                  textColor: Colors.white,
                                )),
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "FavIcon",
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
                                height: 130,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: model.favIon == null
                                      ? smallCustomButtonEdit(
                                          onPress: () {
                                            model.getFavIcon();
                                          },
                                          buttonName: 'Choose Image',
                                          buttonColor: Colors.grey.shade200,
                                          textColor: Colors.black,
                                        )
                                      : InkWell(
                                          onTap: () {
                                            model.getFavIcon();
                                          },
                                          child: Image.file(
                                            model.favIon!,
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
                                  onPress: () {
                                    model.UploadFavIcon();
                                  },
                                  buttonName: 'Update Image',
                                  buttonColor: Colors.black,
                                  textColor: Colors.white,
                                )),
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
                                model.updateProfile(model.appUser, context);
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
        ),
      ));
    }));
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
