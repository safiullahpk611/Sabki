import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class DatabaseStorageServices {
  FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String?> uploadUserImage(File image, String uuid) async {
    // final imagePath = image.path;
    try {
      var reference = _storage.ref().child("UserProfilesImages/$uuid");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot =
      await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }

  Future<String?> uploadAppointmentImages(File image) async {
    // final imagePath = image.path;
    try {
      var reference = _storage
          .ref()
          .child("notesImages/${DateTime.now().microsecondsSinceEpoch}");
      var uploadImage = reference.putFile(image);
      TaskSnapshot snapshot =
      await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }

  Future<String?> uploadGalleryImage({
    required File image,
    required String userId,
    // required String problemId
  }) async {
    try {
      var fileName = (image.path.split('/').last);
      print("$fileName");
      var reference =
      _storage.ref().child("posts/$userId/ProblemData/$fileName");

      var uploadImage = reference.putFile(image);
      print("image" + image.toString());

      TaskSnapshot snapshot = await uploadImage.whenComplete(
            () => print('Image Uploaded'),
      );

      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    } catch (e) {
      print("Exception@uploadProblemPic ==> $e");
      // return null;
      throw "image-upload-error";
    }
  }
}