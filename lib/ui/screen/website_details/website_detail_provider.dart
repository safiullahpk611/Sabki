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

class WebsiteDetailProvider extends BaseViewModal{
  final formKey = GlobalKey<FormState>();
   final locateUser = locator<AuthServices>();
     final databaseServices = DatabaseServices();
       AppUser appUser = AppUser();

   TextEditingController homePageHeading= TextEditingController();
  TextEditingController homePageSubHeading= TextEditingController();
     TextEditingController bussinessShortDescription = TextEditingController();
  

 WebsiteDetailProvider(){
   appUser = locateUser.appUser;
  homePageHeading =
        TextEditingController(text: locateUser.appUser.homePageHeading);
    homePageSubHeading =
        TextEditingController(text: locateUser.appUser.homePageSubHeading);
          bussinessShortDescription =
        TextEditingController(text: locateUser.appUser.bussinessShortDescription);
    
   
 }
 
 
 
  updateProfile(AppUser appUser, BuildContext context) async {
    setState(ViewState.busy);
    await databaseServices.updateUserProfile(appUser);
    setState(ViewState.idle);
    print("profile updated successfully");

    Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          myBottomNavigationBar()));
  }
 


}