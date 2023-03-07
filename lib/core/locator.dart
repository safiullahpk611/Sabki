
import 'package:flutter_login_ui/core/services/auth_Services.dart';
import 'package:get_it/get_it.dart';
GetIt locator = GetIt.instance;

setupLocator() {
  print("AuthServices calling");
  locator.registerSingleton(AuthServices());
  // deviceLocator.registerSingleton(DeviceType());
  // locator.registerSingleton(DatabaseServices());
  print("AuthServices registered");
}
