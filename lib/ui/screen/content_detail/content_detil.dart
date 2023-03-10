import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/auth/signin_sceen/login_screen.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_sign_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../core/enums/view_state.dart';
import '../build_website/build_website.dart';
import '../profile_screen/profile_screen_provider.dart';
import '../website_details/website_details.dart';
import '../widgets/text_field.dart';
import 'contact_detail_provider.dart';

class ContentDetail extends StatelessWidget {
  const ContentDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return ContactDetailProvider();
    }, child: Consumer<ContactDetailProvider>(builder: (context, model, child) {
      return Scaffold(
          body: ModalProgressHUD(
        progressIndicator: CircularProgressIndicator(
          color: Colors.blue,
        ),
        inAsyncCall: model.state == ViewState.busy,
        child: SafeArea(
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
              child: Form(
                key: model.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Center(
                        child: SvgPicture.asset(
                          'assets/images/Sabki.site (3).svg',
                          width: 100,
                        ),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Text("Content Detail",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins-Light'),
                          )),
                    ]),
                    SizedBox(
                      height: 15,
                    ),
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
                              onPress: (value) {
                                model.appUser.contactPerson = value;
                              },
                              controller: model.contactPerson,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email";
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
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
                              onPress: (value) {
                                model.appUser.nameOFDropdownresult = value;
                              },
                              controller: model.nameOFDropdownresult,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter dropDown value";
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Mobile No",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light'),
                              ),
                            ),
                            CustomTextFields(
                              hintText: 'Enter here your Mobile No',
                              onPress: (value) {
                                model.appUser.phoneNo = value;
                              },
                              controller: model.mobileNumber,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your phone";
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Secondly Mobile No",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light'),
                              ),
                            ),
                            CustomTextFields(
                              onPress: (value) {
                                model.appUser.secPhoneNo = value;
                              },
                              controller: model.secMobileNumController,
                              hintText: 'Enter here your Second Mobile No',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your phone";
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Email ID",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light'),
                              ),
                            ),
                            CustomTextFields(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email";
                                }
                                if (!value.contains("@")) {
                                  return "Enter valid email";
                                }
                              },
                              onPress: (value) {
                                model.appUser.emailId = value;
                              },
                              controller: model.emailController,
                              hintText: 'Enter here your Email ID',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Secondly Email ID",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light'),
                              ),
                            ),
                            CustomTextFields(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter your email";
                                }
                                if (!value.contains("@")) {
                                  return "Enter valid email";
                                }
                              },
                              onPress: (value) {
                                model.appUser.userSecEmail = value;
                              },
                              controller: model.secEmailController,
                              hintText: 'Enter here your Secondly Email ID',
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Address",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light'),
                              ),
                            ),
                            CustomTextFields(
                              onPress: (value) {
                                model.appUser.address = value;
                              },
                              controller: model.addressController,
                              hintText: 'Enter here your Address',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter address";
                                }
                              },
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Map Location",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light'),
                              ),
                            ),
                            CustomTextFields(
                              onPress: (value) {
                                model.appUser.mapLocation = value;
                              },
                              controller: model.mapAddressController,
                              hintText: 'Select Map Location',
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Please enter Map location";
                                }
                              },
                            ),
                            //------------------upload Logo------------------

                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 35),
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
        ),
      ));
    }));
  }
}

class smallCustomButtom extends StatelessWidget {
  final buttonName;
  Color buttonColor;
  Color textColor;
  final onPress;
  smallCustomButtom({
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
          color: buttonName,
        ),
        child: Center(child: buttonName),
      ),
    );
  }
}
