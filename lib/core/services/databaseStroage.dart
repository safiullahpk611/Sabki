import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class DatabaseStorage {
  FirebaseStorage _storage = FirebaseStorage.instance;
  Future<String?> uploadUserImage(Uint8List? uploadedImage,String uuid) async{
    // final imagePath = image.path;
    try{
      var reference = _storage.ref().child("imagesFromWeb/$uuid");
      var uploadImage = reference.putData(
        uploadedImage!,
        SettableMetadata(contentType: 'image/jpeg'),
      );
      TaskSnapshot snapshot = await uploadImage.whenComplete(() => print('Image Uploaded'));
      final imageUrl = snapshot.ref.getDownloadURL();
      return imageUrl;
    }catch(e){
      print("Exception@uploadUserImage=> $e");
      return null;
    }
  }
}










