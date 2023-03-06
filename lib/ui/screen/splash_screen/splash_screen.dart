import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/youtube.dart';

import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/services/auth_Services.dart';
import '../../../pages/locator.dart';
import '../auth/signin_sceen/login_page.dart';
import '../forgot_password/forgot_password_page.dart';
import '../selection_screen/selection_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isVisible = false;
  // final _authService = locator<AuthServices>();

  splashScreenDelay() async {
    print("splash delay callng");
    ///
    /// splash screen delay
    ///
    await Future.delayed(Duration(seconds: 3));
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>SelectionScreen()));
    // print(_authService.isLogin);

    
  //   //  Get.offAll(() => LoginScreen());
  //   // Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)));
  //   if (_authService.appUser.appUserId != null && _authService.isLogin!) {
  //     if (_authService.appUser.isfirstLogin ==true) {
  //      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>YoutubePlay()));
  //     } else {
  //      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ForgotPasswordPage()));
  //       print('User id=> ${_authService.appUser.appUserId}');
  //     }
  //   } else if (_authService.appUser == null && !_authService.isLogin!) {
  //       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    
  //     print("App user name ${_authService.appUser.userEmail}");
  //     print("isLogin ${_authService.isLogin}");
  //   } else {
  // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  //     print("User email ${_authService.appUser.userEmail}");
  //     print("isLogin ${_authService.isLogin}");
  //   }
  }

  _SplashScreenState(){

    // new Timer(const Duration(milliseconds: 2000), (){
    //   setState(() {
    //     Navigator.of(context).pushAndRemoveUntil(
    //     MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
    //   });
    // });

    // new Timer(
    //   Duration(milliseconds: 10),(){
    //     setState(() {
    //       _isVisible = true; // Now it is showing fade effect and navigating to Login page
    //     });
    //   }
    // );
 
  }

  @override
     initState(){
      splashScreenDelay();
      super.initState();
    }

  Widget build(BuildContext context) {



   return Scaffold(
    backgroundColor: Colors.black,
    body: Center(child: SvgPicture.asset('assets/images/Sabki.site.svg')),
   );

















    // return Container(
    //   decoration: new BoxDecoration(
    //     gradient: new LinearGradient(
    //       colors: [Theme.of(context).accentColor, Theme.of(context).primaryColor],
    //       begin: const FractionalOffset(0, 0),
    //       end: const FractionalOffset(1.0, 0.0),
    //       stops: [0.0, 1.0],
    //       tileMode: TileMode.clamp,
    //     ),
    //   ),
    //   child: AnimatedOpacity(
    //     opacity: _isVisible ? 1.0 : 0,
    //     duration: Duration(milliseconds: 1200),
    //     child: Center(
    //       child: Container(
    //         height: 140.0,
    //         width: 140.0,
    //         child: Center(
    //           child: ClipOval(
    //             child: Icon(Icons.android_outlined, size: 128,), //put your logo here
    //           ),
    //         ),
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Colors.white,
    //           boxShadow: [
    //             BoxShadow(
    //               color: Colors.black.withOpacity(0.3),
    //               blurRadius: 2.0,
    //               offset: Offset(5.0, 3.0),
    //               spreadRadius: 2.0,
    //             )
    //           ]
    //         ),
    //       ),
    //     ),
    //   ),
    // );
  }
}