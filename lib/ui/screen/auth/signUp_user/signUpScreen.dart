import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/auth/signin_sceen/loginProvider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom_sign_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import 'signup_provider.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) {
      return SignUpProviderScreen();
    }, child: Consumer<SignUpProviderScreen>(builder: (context, model, child) {
      return Scaffold(
        // backgroundColor: Colors.black,
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
              image: AssetImage("assets/images/signUpBackgrund.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.1), BlendMode.dstATop),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.12),
                      Center(
                          child: SvgPicture.asset(
                              'assets/images/Sabki.site (1).svg')),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Text(
                        "Create an Account",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins-Light')),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Connect with Your friend Today",
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Poppins-Light')),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.08),
                    ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Email Address",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins-Light'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomSignTextfield(
                        hintText: 'Email Address',
                        //  suffixIcon: Icon(Icons.email,color: Colors.white,)
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04),
                      Text(
                        "Password",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              fontFamily: 'Poppins-Light'),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      CustomSignTextfield(
                        hintText: 'Enter Your Password',
                        suffixIcon: Icon(
                          Icons.remove_red_eye_sharp,
                          color: Colors.white,
                        ),
                        obsecureText: true,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Row(children: [
                                  Container(
                                      // color: Colors.white,
                                      child: Checkbox(
                                    onChanged: (val) {
                                      model.chanegeCheckBox(val);
                                    },
                                    value: model.checkBoxVal,
                                    checkColor: Colors.white,
                                    side: BorderSide(color: Colors.white),
                                  )),
                                  Container(
                                    child: Text(
                                      "I agree to terms and Conditions",
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: 'Poppins-Light'),
                                      ),
                                    ),
                                  )
                                ]),
                              ),
                              // Container(
                              //     child: TextButton(
                              //   child: Text("Forgot Password"),
                              //   onPressed: () {},
                              // ))
                            ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomSignButton(
                          buttoncolor: Colors.white,
                          textColor: Colors.black,
                          buttonName: 'Login',
                          onPress: () {
                            // Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //         builder: (context) => LoginScreen()));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(children: [
                          Expanded(
                              child: Container(
                            height: 2,
                            width: double.infinity,
                            color: Colors.white,
                          )),
                          Expanded(
                              child: Container(
                            width: double.infinity,
                            child: Text(
                              "   or Login with ",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'Poppins-Light'),
                              ),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            height: 2,
                            width: double.infinity,
                            color: Colors.white,
                          )),
                        ]),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.05),
                      Container(
                        child: Row(children: [
                          Expanded(
                              child: Container(
                            child: Center(
                                child:
                                    Image.asset('assets/images/facebook.png')),
                          )),
                          Expanded(
                              child: Container(
                            child: Center(
                                child: Image.asset('assets/images/google.png')),
                          )),
                          Expanded(
                              child: Container(
                            child: Center(
                                child: Image.asset('assets/images/call.png')),
                          )),
                        ]),
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have an Account?",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                
                                  fontFamily: 'Poppins-Light'),
                            ),
                          ),
                          TextButton(onPressed: () {}, child: Text("Login"))
                        ],
                      ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }));
  }
}

class CustomSignTextfield extends StatelessWidget {
  final hintText;
  final suffixIcon;
  final obsecureText;
  const CustomSignTextfield(
      {this.hintText, this.suffixIcon, super.key, this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          obscureText: obsecureText,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}
