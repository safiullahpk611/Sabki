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
import '../content_detail/content_detil.dart';
import '../website_details/website_details.dart';

class ContactDetailProvider extends BaseViewModal {
  final formKey = GlobalKey<FormState>();
  final locateUser = locator<AuthServices>();
  final databaseServices = DatabaseServices();
  AppUser appUser = AppUser();

  TextEditingController contactPerson = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController secMobileNumController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController secEmailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController mapAddressController = TextEditingController();
  TextEditingController nameOFDropdownresult = TextEditingController();

  ContactDetailProvider() {
    appUser = locateUser.appUser;
    contactPerson =
        TextEditingController(text: locateUser.appUser.contactPerson);
    mobileNumber = TextEditingController(text: locateUser.appUser.phoneNo);
    secMobileNumController =
        TextEditingController(text: locateUser.appUser.secPhoneNo);

    emailController = TextEditingController(text: locateUser.appUser.emailId);
    secEmailController =
        TextEditingController(text: locateUser.appUser.userSecEmail);

    addressController = TextEditingController(text: locateUser.appUser.address);
    mapAddressController =
        TextEditingController(text: locateUser.appUser.mapLocation);

    nameOFDropdownresult =
        TextEditingController(text: locateUser.appUser.nameOFDropdownresult);
  }

  updateProfile(AppUser appUser, BuildContext context) async {
    setState(ViewState.busy);
    await databaseServices.updateUserProfile(appUser);
    setState(ViewState.idle);
    print("profile updated successfully");

    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => WebsiteDetailScreen()));
  }
}
