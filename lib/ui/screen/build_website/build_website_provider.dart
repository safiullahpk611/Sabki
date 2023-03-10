import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/enums/view_state.dart';
import 'package:flutter_login_ui/core/models/base_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/locator.dart';
import '../../../core/models/appUser.dart';
import '../../../core/services/auth_Services.dart';
import '../../../core/services/database_services.dart';
import '../../../core/services/database_storage_services.dart';
import '../edit_profile/edit_profile.dart';
import '../widgets/custom_sign_button.dart';
import 'build_website.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class BuildWebsiteProvider extends BaseViewModal {
  final PageController controller = PageController(initialPage: 0);

  int radio = 0;
  radioBoxVa(val) {
    radio = val;
    notifyListeners();
  }

  AppUser appUser = AppUser();
  final locateUser = locator<AuthServices>();
  final formKey = GlobalKey<FormState>();
  final databaseServices = DatabaseServices();
  
  final currentAppUser = locator<AuthServices>().appUser;
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();


  String? editName;

  TextEditingController nameController = TextEditingController();
  TextEditingController businessNameController = TextEditingController();
  TextEditingController websiteUrlController = TextEditingController();
  BuildWebsiteProvider() {
    print("<<<<<<<<<<<");
    appUser = locateUser.appUser;

    businessNameController =
        TextEditingController(text: locateUser.appUser.businessName);
    websiteUrlController =
        TextEditingController(text: locateUser.appUser.websiteUrl);
    print("<<<<<<<<<<< ${nameController.text}");
  }

  getAppUserData() async {
    // appUser = await databaseServices.getUser("do4rbk74ruUTZ9Cett39bLSauxu2");
    notifyListeners();
  }

  ///
  ///  Update User Detail =========================================>>>
  ///

  updateProfile(AppUser appUser, BuildContext context) async {
    setState(ViewState.busy);
    await databaseServices.updateUserProfile(appUser);
    setState(ViewState.idle);
    print("profile updated successfully");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProfile()),
    );
  }

  final List<Map<String, String>> onboardingData = [
    {'image': 'assets/images/Rectangle 183.png'},
    {'image': 'assets/images/Rectangle 183.png'},
    {'image': 'assets/images/Rectangle 183.png'},
  ];
  double currentPage = 0;

  void nextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void previousPage() {
    controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  onChangedFunc(double a) {
    currentPage = a;
    notifyListeners();
  }

  int selectedOption = 0;

  final List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];
  var getUrl;
  var fileName;
  DatabaseStorageServices databaseStorage = DatabaseStorageServices();
  File? image;
   File? favIon;
  bool isLoading = false;
  // Future<void> getImageFromGallery() async {
  //   final pickedFile =
  //       await ImagePicker().getImage(source: ImageSource.gallery) as PickedFile;
  //   if (pickedFile != null) {
  //     image = File(pickedFile.path);
  //     notifyListeners();
  //   }
  // }
  
  ///  File? image ======>>>
  ///
 
}
