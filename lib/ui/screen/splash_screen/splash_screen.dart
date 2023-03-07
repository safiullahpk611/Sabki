import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/bottom_navigationbar/bottom_navigationbar.dart';
import 'package:flutter_login_ui/ui/screen/home_screen/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/locator.dart';
import '../../../core/services/auth_Services.dart';
import '../auth/signUp_user/signUpScreen.dart';
import '../auth/signin_sceen/login_screen.dart';
import '../selection_screen/selection_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthServices>();

  void initState() {
    Timer(Duration(seconds: 3), () {
      (FirebaseAuth.instance.currentUser != null)
          ? Get.off(() => myBottomNavigationBar())
          : Get.off(() => LoginScreen());
    });
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: SvgPicture.asset('assets/images/Sabki.site.svg')),
    );
  }
}
