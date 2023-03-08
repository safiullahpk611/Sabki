import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/bottom_navigationbar/bottom_navigationbar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/locator.dart';
import '../../../core/services/auth_services.dart';
import '../auth/signin_sceen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = locator<AuthServices>();

  @override
  void initState() {
    splashScreenDelay();

    super.initState();
  }

  splashScreenDelay() async {
    ///
    /// splash screen delay
    ///
    await Future.delayed(Duration(seconds: 3));

    if (_authService.appUser.appUserId != null && _authService.isLogin!) {
      if (_authService.appUser.isFirstLogin ?? false) {
        Get.offAll(
              () => myBottomNavigationBar(),
        );
      } else {
        Get.offAll(() => myBottomNavigationBar());
        print('User id=> ${_authService.appUser.appUserId}');
        Future.delayed(Duration(seconds: 1));
        // Get.snackbar("Congrats", "message",snackStyle: SnackStyle.FLOATING,isDismissible: true);
      }
    } else if (_authService.appUser == null && !_authService.isLogin!) {
      Get.offAll(() => LoginScreen());
      print("isLogin ${_authService.isLogin}");
    } else {
      Get.offAll(() => LoginScreen());
      print("User email ${_authService.appUser.userEmail}");
      print("isLogin ${_authService.isLogin}");
    }

    // Navigator.push(context, MaterialPageRoute(builder: (context)=>AuthScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: SvgPicture.asset('assets/images/Sabki.site.svg')),
    );
  }
}
