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

class EditProfileProvider extends BaseViewModal {
  TextEditingController businessNameController = TextEditingController();
  TextEditingController websiteUrlController = TextEditingController();
  final locateUser = locator<AuthServices>();
  final databaseServices = DatabaseServices();
  AppUser appUser = AppUser();
  EditProfileProvider() {
    businessNameController =
        TextEditingController(text: locateUser.appUser.businessName);
    websiteUrlController =
        TextEditingController(text: locateUser.appUser.websiteUrl);
  }

  /// Update Profile Function ========>>>
  ///
  updateProfile(AppUser appUser, BuildContext context) async {
    setState(ViewState.busy);
    await databaseServices.updateUserProfile(appUser);
    setState(ViewState.idle);
    print("profile updated successfully");

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ContentDetail()),
    );
  }

  /// Update Image to Storage Function ========>>>
  ///
  DatabaseStorageServices databaseStorageServices = DatabaseStorageServices();
  File? image;
  File? favIon;

  final currentAppUser = locator<AuthServices>().appUser;

  ImagePicker imagePicker = ImagePicker();

  getImage() async {
    final img = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (img != null) {
      image = File(img.path);
      notifyListeners();
    }
  }

  getFavIcon() async {
    final img = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );

    if (img != null) {
      favIon = File(img.path);
      notifyListeners();
    }
  }

  /// Upload Image Function ========>>>
  ///
  UploadImage() async {
    setState(ViewState.busy);

    appUser.appUserId = currentAppUser.appUserId;

    if (image != null) {
      appUser.logoImage = await databaseStorageServices.uploadUserImage(
          favIon!, currentAppUser.appUserId!);
    }
    //postImage.postImageDate = now.toString();

    final result = await databaseServices.updateUserProfile(appUser);
    if (result != true) {}

    setState(ViewState.idle);
  }

  UploadFavIcon() async {
    setState(ViewState.busy);

    appUser.appUserId = currentAppUser.appUserId;

    if (image != null) {
      appUser.favIcon = await databaseStorageServices.uploadUserImage(
          favIon!, currentAppUser.appUserId!);
    }
    //postImage.postImageDate = now.toString();

    final result = await databaseServices.updateUserProfile(appUser);
    if (result != true) {}

    setState(ViewState.idle);
  }
}
