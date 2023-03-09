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
import '../../get_started/get_started.dart';
import '../signin_sceen/login_screen.dart';


class SignUpProvider extends BaseViewModal {
  final _authServices = locator<AuthServices>();
  final locateUser = locator<AuthServices>();
  CustomAuthResult customAuthResult = CustomAuthResult();
  final formKey = GlobalKey<FormState>();
  AppUser appUser = AppUser();
  bool isVisiblePassword = true;

  DatabaseServices databaseServices = DatabaseServices();

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
  /// Sign Up user  =======================================>>>
  ///
  signUpUser(AppUser appUser, BuildContext context) async {
    print("object");
    if (formKey.currentState!.validate()) {
      setState(ViewState.busy);

      print("User Email: ${appUser.userEmail}");
      print("User Password: ${appUser.userPassword}");
      appUser.isFirstLogin = true;
      setState(ViewState.busy);


      customAuthResult = await _authServices.signUpUser(appUser);
      setState(ViewState.idle);
      if (customAuthResult.user != null) {
        print("SignUpUserId=> ${_authServices.appUser.appUserId}");
        Get.off(() => GetStartedScreen());
      } else {
      }}
  }
}

