import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/bottom_navigationbar/bottom_navigationbar.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'core/locator.dart';
import 'ui/screen/splash_screen/splash_screen.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Login UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "Poppins-Light"),
      home: SplashScreen(title: 'Flutter Login UI'),
    );
  }
}


