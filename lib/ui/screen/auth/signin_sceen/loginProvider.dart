import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/models/base_view_model.dart';
import 'package:flutter_login_ui/ui/screen/bottom_navigationbar/bottom_navigationbar.dart';
import 'package:get/get.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/locator.dart';
import '../../../../core/models/appUser.dart';
import '../../../../core/services/auth_Services.dart';
import '../../../../core/services/custom_auth_result.dart';
import '../../../../core/services/database_services.dart';
import 'login_screen.dart';

class LoginProvider extends BaseViewModal {
  final _authService = locator<AuthServices>();
  AppUser appUser = AppUser();
  final databaseServices = DatabaseServices();
  CustomAuthResult? customAuthResult ;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisiblePassword = true;


  ///
  /// Visible Password =================================>>>
  ///
  visiblePassword() {
    print("Password state : $isVisiblePassword");
    isVisiblePassword = !isVisiblePassword;
    notifyListeners();
    print("Password final state : $isVisiblePassword");
  }

  bool checkBoxVal=false;
  chanegeCheckBox(val){

    checkBoxVal=val;
    notifyListeners();
  }
  ///
  /// Login user ============================================>>>
  ///
  loginToApp(AppUser appUser, BuildContext context) async {
    if (formKey.currentState!.validate()) {

      print("App user email: ${appUser.userEmail}");
      print("App user Password: ${appUser.userPassword}");
      setState(ViewState.busy);

      customAuthResult = await _authService.loginUser(appUser);

      setState(ViewState.idle);

      if (customAuthResult?.user != null) {
        print(".............................................");
        print("App user Id: ${_authService.appUser.appUserId}");

        if (_authService.appUser.isFirstLogin == true) {
          Get.off(() => myBottomNavigationBar());
        } else if (_authService.appUser.isFirstLogin == false) {
          Get.off(() => LoginScreen());
        }
      } else {
      Get.showSnackbar(
                  GetSnackBar(
                   
                    message: 'Wrong password',
              
                    duration: const Duration(seconds: 3),
                  ),
                );
      }
    }
  }
}