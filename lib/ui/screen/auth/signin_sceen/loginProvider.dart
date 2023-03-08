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

class LoginProvider extends BaseViewModal {
  LoginProvider() {
    print("SignIncProvider built");
  }

  AppUser appUser = AppUser();
  final databaseServices = DatabaseServices();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _authServices = locator<AuthServices>();
  CustomAuthResult customAuthResult = CustomAuthResult();
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

  bool checkBoxVal = false;
  chanegeCheckBox(val) {
    checkBoxVal = val;
    notifyListeners();
  }

  ///
  /// Login user ============================================>>>
  ///
  ///
  ///

  loginUser(AppUser appUser, BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("App user emailllllll: ${appUser.userEmail}");
      print("App user Password: ${appUser.password}");
      setState(ViewState.busy);
      customAuthResult = await _authServices.loginUser(appUser);

      setState(ViewState.idle);

      if (customAuthResult.user != null) {
        print("App user Id: ${_authServices.appUser.appUserId}");
        print("Is first Login=> ${_authServices.appUser.isFirstLogin}");
        if (_authServices.appUser.isFirstLogin == true) {
          Get.off(() => myBottomNavigationBar());

        } else if (_authServices.appUser.isFirstLogin == false) {
          //
        }
      } else {
        Get.snackbar(
          "Error",
          backgroundColor: Colors.white,
          customAuthResult.errorMessage.toString(),
          snackPosition: SnackPosition.BOTTOM,
        );

        print(customAuthResult.errorMessage.toString());

        //      }
      }
    }
  }
}
