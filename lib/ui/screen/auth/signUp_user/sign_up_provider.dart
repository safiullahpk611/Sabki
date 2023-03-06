// import 'package:flutter_login_ui/core/models/base_view_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login_ui/pages/youtube.dart';

// import '../../../../common/theme_helper.dart';
// import '../../../../core/enums/view_state.dart';
// import '../../../../core/models/appUser.dart';

// import '../../../../core/services/auth_Services.dart';
// import '../../../../core/services/custom_auth_result.dart';
// import '../../../../pages/locator.dart';
// import 'package:get/get.dart';

// import '../../widgets/custom_page_route.dart';

// class SignUpProvider extends BaseViewModal {
//   // final authServices = AuthServices();
//   final _authServices = locator<AuthServices>();
//   CustomAuthResult customAuthResult = CustomAuthResult();
//   AppUser appUser = AppUser();
//   final formKey = GlobalKey<FormState>();
//   bool isAgreeTermsAndConditions = false;
//   bool isVisiblePassword = true;
//   bool checkedValue = false;
//   bool checkboxValue = false;

//   ///
//   /// Sign Up user
//   ///
//   signUpUser(AppUser appUser, BuildContext context) async {
//     if (formKey.currentState!.validate()) {
//       print("User Name: ${appUser.userEmail}");
//       // print("User Email: ${appUser.userEmail}");
//       print("User Password: ${appUser.userPassword}");
//       // print("User ConfirmPassword: ${appUser.confirmPassword}");
//       appUser.isfirstLogin = true;
//       setState(ViewState.busy);

//       customAuthResult = await _authServices.signUpUser(appUser);
//       setState(ViewState.idle);
//       if (customAuthResult.user != null) {
//         print("SignUpUserId=> ${_authServices.appUser.appUserId}");
//         Navigator.pushReplacement(
//             context, CustomPageRoute(child: YoutubePlay()));
//       } else {
//         Get.defaultDialog(
//           title: "Error Message",
//           confirmTextColor: Colors.white,
//           onConfirm: () {
//             Navigator.pop(context);
//           },
//           content: Text(customAuthResult.errorMessage!),
//         );
//       }

//       // Get.offAll(()=>WalkThroughScreen());
//     }
//   }

//   changeCheckboxValue(val) {
//     checkboxValue = val!;
//     notifyListeners();
//   }

//   void showPop(BuildContext context, String dialogMessege1, String dialogMessege2) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return ThemeHelper().alartDialog(
//             dialogMessege1, dialogMessege2, context);
//       },
//     );
//   }
// }
