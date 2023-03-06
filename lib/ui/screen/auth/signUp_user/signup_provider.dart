import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/models/base_view_model.dart';

class SignUpProviderScreen extends BaseViewModal{

  bool checkBoxVal=false;
  chanegeCheckBox(val){

    checkBoxVal=val;
    notifyListeners();
  }
}