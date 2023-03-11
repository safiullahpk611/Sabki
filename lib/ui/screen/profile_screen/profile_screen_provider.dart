import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/enums/view_state.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/locator.dart';
import '../../../core/models/appUser.dart';
import '../../../core/models/base_view_model.dart';
import '../../../core/services/auth_Services.dart';
import '../../../core/services/custom_auth_result.dart';
import '../../../core/services/database_services.dart';
import '../../../core/services/database_storage_services.dart';
import '../auth/signin_sceen/login_screen.dart';

class ProfileScreenProvider extends BaseViewModal {

  final databaseServices = DatabaseServices();
  final customAuthResult = CustomAuthResult();
  final authInstant = FirebaseAuth.instance;
  bool? isLogin;
  User? user;
  AppUser appUser = AppUser();
  int value = 0;

  getValue(int x) {
    value = x;
    notifyListeners();
  }

  ///
  ///  Sign Out Function =====================>>>
  ///
  ///
   final formKey = GlobalKey<FormState>();
  final locateUser = locator<AuthServices>();



  TextEditingController username = TextEditingController();
  TextEditingController companyName= TextEditingController();
  TextEditingController emailId = TextEditingController();
    TextEditingController bussinessShortDesciption = TextEditingController();
      TextEditingController countryName = TextEditingController();
        TextEditingController phoneNo = TextEditingController();
          TextEditingController dateofBirth = TextEditingController();
          TextEditingController instagramUrl= TextEditingController();
  TextEditingController facebookUrl= TextEditingController();
     TextEditingController twittrerUrl = TextEditingController();
       TextEditingController youtubeUrl = TextEditingController();

  ProfileScreenProvider() {
    appUser = locateUser.appUser;
    username =
        TextEditingController(text: locateUser.appUser.userName);

    emailId =

        TextEditingController(text: locateUser.appUser.emailId);
    companyName = TextEditingController(
        text: locateUser.appUser.companyName);

         bussinessShortDesciption = TextEditingController(
        text: locateUser.appUser.bussinessShortDescription);

            countryName = TextEditingController(
        text: locateUser.appUser.countryName);

                 phoneNo = TextEditingController(
        text: locateUser.appUser.phoneNo);

               dateofBirth = TextEditingController(
        text: locateUser.appUser.dateofBirth);

          instagramUrl =
        TextEditingController(text: locateUser.appUser.instagramUrl);
    facebookUrl =
        TextEditingController(text: locateUser.appUser.facebookUrl);
          twittrerUrl =
        TextEditingController(text: locateUser.appUser.twittrerUrl);
         youtubeUrl =
        TextEditingController(text: locateUser.appUser.youtubeUrl);
   

  }

  updateProfile(AppUser appUser, BuildContext context) async {
    setState(ViewState.busy);
  var result=  await databaseServices.updateUserProfile(appUser);
    setState(ViewState.idle);
    if(result!=null){
       Get.showSnackbar(
                  GetSnackBar(
                   backgroundColor: Colors.yellow,
                    message: 'Updated Sucessfully',
              
                    duration: const Duration(seconds: 5),
                  ),
                );
    }
    print("profile updated successfully");
     
    // Navigator.pushReplacement(context,
    //     MaterialPageRoute(builder: (context) => myBottomNavigationBar()));
  }
    DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  final currentAppUser = locator<AuthServices>().appUser;
  void logout(BuildContext context) async {
    await authInstant.signOut();
    this.isLogin = false;
    this.appUser = AppUser();
    this.user = null;

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
    print("==========>>> User logout Successfully....");
    print(">>>>>>>>>>${user}");

    //Get.offAll(() => SignInScreen(), predicate: (route) => false);
  }
  bool imgExist=false;
   ImagePicker imagePicker = ImagePicker();
File? image;
  getImage() async {
    final img = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (img != null) {
      image = File(img.path);
      imgExist=true;

      notifyListeners();
      print(imgExist);
    }
  }
   UploadImage() async {
    setState(ViewState.busy);

    appUser.appUserId = currentAppUser.appUserId;

    if (image != null) {
      appUser.profileImage = await databaseStorageServices.uploadUserImage(
          image!, currentAppUser.appUserId!);
    }
    //postImage.postImageDate = now.toString();

    final result = await databaseServices.updateUserProfile(appUser);
    if (result != true) {}

    setState(ViewState.idle);
  }
  

}
