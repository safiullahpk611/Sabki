import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/locator.dart';
import 'package:flutter_login_ui/ui/screen/bottom_navigationbar/bottom_navigationbar.dart';
import 'package:flutter_login_ui/ui/website_detail_screen/website_detail_screen.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import 'ui/screen/auth/signUp_user/signUpScreen.dart';
import 'ui/screen/splash_screen/splash_screen.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   await setupLocator();
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {

  Color _primaryColor = HexColor('#DC54FE');
  Color _accentColor = HexColor('#8A02AE');

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    print("before get");
    return GetMaterialApp(
      title: 'Sabki.Site',
      debugShowCheckedModeBanner: false,
    
        theme: ThemeData(fontFamily: "Poppins-Light"),
      // home: SplashScreen(title: 'Flutter Login UI'),
       home:  SplashScreen(),
    );
  }
}


