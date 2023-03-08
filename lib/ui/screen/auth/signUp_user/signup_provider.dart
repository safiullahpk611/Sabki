import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/models/base_view_model.dart';
import 'package:flutter_login_ui/ui/screen/bottom_navigationbar/bottom_navigationbar.dart';
import 'package:get/get.dart';
import '../../../../core/enums/view_state.dart';
import '../../../../core/locator.dart';
import '../../../../core/models/appUser.dart';
import '../../../../core/services/auth_services.dart';
import '../../../../core/services/custom_auth_result.dart';
import '../../../../core/services/database_services.dart';

class SignUpProvider extends BaseViewModal {
  SignUpProvider() {
    print("SignUp Provider built");
  }

  final _authServices = locator<AuthServices>();
  CustomAuthResult customAuthResult = CustomAuthResult();
  AppUser appUser = AppUser();
  final formKey = GlobalKey<FormState>();
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

  bool checkBoxVal = false;
  chanegeCheckBox(val) {
    checkBoxVal = val;
    notifyListeners();
  }

  /// SignUp User  =======>>>>>
  ///
  signUpUser(AppUser appUser, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("User Email: ${appUser.userEmail}");
      print("User Password: ${appUser.password}");
      //
      appUser.isFirstLogin = true;
      setState(ViewState.busy);


      ///
      customAuthResult = await _authServices.signUpUser(appUser);
      setState(ViewState.idle);
      if (customAuthResult.user != null) {
        print("SignUpUserId=> ${_authServices.appUser.appUserId}");
        Get.off(() => myBottomNavigationBar());

        // Navigator.pushReplacement(
        //     context, CustomPageRoute(child: BottomNavigation()));
      } else {
        print(customAuthResult.errorMessage.toString());
      }
    } else {
      print("not showing true");
    }
    //
  }

}
