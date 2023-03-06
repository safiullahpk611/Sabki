

import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/enums/view_state.dart';


class BaseViewModal extends ChangeNotifier{
  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  void setState(ViewState state){
    _state = state;
    notifyListeners();
  }
}