import '../../../core/models/base_view_model.dart';

class ProfileScreenProvider extends BaseViewModal {

  int value = 0;

  getValue(int x) {
    value = x;
    notifyListeners();
  }
}
