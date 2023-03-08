import '../../../core/models/appUser.dart';
import '../../../core/models/base_view_model.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../core/services/custom_auth_result.dart';
import '../../../core/services/database_services.dart';
import '../auth/signin_sceen/login_screen.dart';

class ProfileScreenProvider extends BaseViewModal {
  final databaseServices = DatabaseServices();
  final customAuthResult = CustomAuthResult();
  final authInstant = FirebaseAuth.instance;
  bool? isLogin;
  User? user;
  AppUser appUser = AppUser();
  int value = 0;

  getValue(int x) {
    value = x;
    notifyListeners();
  }

  ///
  ///  Sign Out Function =====================>>>
  ///
  void logout(BuildContext context) async {
    await authInstant.signOut();
    this.isLogin = false;
    this.appUser = AppUser();
    this.user = null;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
    print("==========>>> User logout Successfully....");
    print(">>>>>>>>>>${user}");

    //Get.offAll(() => SignInScreen(), predicate: (route) => false);
  }
}
