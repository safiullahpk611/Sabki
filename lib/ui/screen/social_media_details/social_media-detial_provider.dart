import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/enums/view_state.dart';
import 'package:flutter_login_ui/core/models/base_view_model.dart';
import 'package:image_picker/image_picker.dart';

import '../../../core/locator.dart';
import '../../../core/models/appUser.dart';
import '../../../core/services/auth_Services.dart';
import '../../../core/services/database_services.dart';
import '../../../core/services/database_storage_services.dart';
import '../bottom_navigationbar/bottom_navigationbar.dart';
import '../content_detail/content_detil.dart';
import '../website_details/website_details.dart';

class SocialMediaDetailProvider extends BaseViewModal{
  final formKey = GlobalKey<FormState>();
   final locateUser = locator<AuthServices>();
     final databaseServices = DatabaseServices();
       AppUser appUser = AppUser();

   TextEditingController instagramUrl= TextEditingController();
  TextEditingController facebookUrl= TextEditingController();
     TextEditingController twittrerUrl = TextEditingController();
       TextEditingController youtubeUrl = TextEditingController();

 SocialMediaDetailProvider(){
   appUser = locateUser.appUser;
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
    await databaseServices.updateUserProfile(appUser);
    setState(ViewState.idle);
    print("profile updated successfully");

    // Navigator.pushReplacement(
    //                               context,
    //                               MaterialPageRoute(
    //                                   builder: (context) =>
    //                                       myBottomNavigationBar()));
  }
 


}