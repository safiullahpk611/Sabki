import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/enums/view_state.dart';
import '../../../../core/locator.dart';
import '../../../../core/models/appUser.dart';
import '../../../../core/models/base_view_model.dart';
import '../../../../core/services/auth_Services.dart';
import '../../../../core/services/custom_auth_result.dart';


class ResetPassswodProvider extends BaseViewModal {
  final _authServices = locator<AuthServices>();
  final formKey = GlobalKey<FormState>();
  String email = '';
  AppUser appUser = AppUser();
  CustomAuthResult customAuthResult = CustomAuthResult();

  bool isResetLinkSend = false;

  ///
  /// Reset password
  ///

  resetPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      setState(ViewState.busy);
      isResetLinkSend = await _authServices.resetUserPassword(email);

      setState(ViewState.idle);
      if (isResetLinkSend) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Please check your email'),
          ),
        );

      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("User with this email doesn't exist."),
          ),
        );
      }
    }
  }
}
