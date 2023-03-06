// import 'package:flutter/cupertino.dart';
// import 'package:flutter_login_ui/core/models/appUser.dart';
// import 'package:flutter_login_ui/core/models/base_view_model.dart';

// import '../../../../core/enums/view_state.dart';
// import '../../../../core/services/auth_Services.dart';
// import '../../../../core/services/custom_auth_result.dart';
// import '../../../../pages/locator.dart';
// import '../../../../pages/youtube.dart';
// import '../../widgets/custom_page_route.dart';
// import '../../widgets/custom_snacke_bar.dart';



// class SignInProvider extends BaseViewModal{
// AppUser appUser= AppUser();
//   final formKey = GlobalKey<FormState>();
//     CustomAuthResult customAuthResult = CustomAuthResult();
//      final _authService = locator<AuthServices>();
//   loginToApp(AppUser appUser, BuildContext context) async {
//     if (formKey.currentState!.validate()) {
//       print("App user email: ${appUser.userEmail}");
//       print("App user Password: ${appUser.userPassword}");
//       setState(ViewState.busy);

//       customAuthResult = await _authService.loginUser(appUser);

//       if (customAuthResult.user != null) {
//         appUser.isfirstLogin=true;
//           Navigator.pushReplacement(
//               context, CustomPageRoute(child: YoutubePlay()));
//         print("App user Id: ${_authService.appUser.appUserId}");
//         print("Is first Login=> ${_authService.appUser.isfirstLogin}");

//         appUser = _authService.appUser;
      
 


       
//       } else {
//         showSnackBar(
//           context,
//           "${customAuthResult.errorMessage!}",
//           duration: 5000,
//         );
//       }

//       setState(ViewState.idle);
//     }
//   }
// }