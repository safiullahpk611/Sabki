import 'package:flutter/cupertino.dart';
import 'package:flutter_login_ui/core/models/base_view_model.dart';

import '../../../../core/locator.dart';
import '../../../../core/services/auth_Services.dart';




class SignInWithPhoneNumberProvider extends BaseViewModal{
    final authServices = locator<AuthServices>();
  final formKey = GlobalKey<FormState>();
  TextEditingController phoneNoController = TextEditingController();
SignInWithPhoneNumber(BuildContext context)async{
await authServices.signUpWithPhoneNum(phoneNoController,context);


}

}