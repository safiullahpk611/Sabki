import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/appUser.dart';


class DatabaseServices {
  final firebaseFireStore = FirebaseFirestore.instance;
  // postData(LinkAddress linkAddress) async {
  //   try {
  //     await firebaseFireStore
  //         .collection('AddressLink')
  //         .doc('doc')
  //         .set(linkAddress.toJson());

  //     return true;
  //   } catch (e) {
  //     print("Exception@MakingPostImage=>$e");
  //   }
  // }

  // updateData(LinkAddress linkAddress) async {
  //   try {
  //     await firebaseFireStore
  //         .collection('AddressLink')
  //         .doc('doc')
  //         .update(linkAddress.toJson());

  //     return true;
  //   } catch (e) {
  //     print("Exception@MakingPostImage=>$e");
  //   }
  // }

  //   Stream<QuerySnapshot>? getLinkAdress(){

  //   try {
  //    Stream<QuerySnapshot> snapshot = firebaseFireStore
  //         .collection('AddressLink')
  //         .snapshots() as Stream<QuerySnapshot>;
  //     print("Successfully Fetched");
  //     return snapshot;
  //   } catch (e) {
  //     print('Exception@ GetWeeklyWeight ==> $e');
  //     return null;
  //   }

  // }

  // Future<LinkAddress> getUser() async {
  //   try {
  //     print('GetUser id:');
  //     final snapshot =
  //         await firebaseFireStore.collection('AddressLink').doc('doc').get();
  //     print("assigning to model");
  //     return LinkAddress.fromJson(snapshot.data(), snapshot.id);
  //   } catch (e) {
  //     print('Exception @DatabaseService/getUser $e');
  //     return LinkAddress(prizeitems: []);
  //   }
  // }
  //   Future<AppUser> getUsers(id) async {
  //   print('GetUser id: $id');
  //   try {
  //     final snapshot =
  //         await firebaseFireStore.collection('AppUser').doc(id).get();
  //     // print('Current app User Data: ${snapshot.data()}');
  //     return AppUser.fromJson(snapshot.data(), snapshot.id);
  //   } catch (e) {
  //     print('Exception @DatabaseService/getUser $e');
  //     return AppUser();
  //   }

 ///
  /// Get user
  ///  ///
  /// Get user
  ///
  Future<AppUser> getUser(id) async {
    print('GetUser id: $id');
    try {
      final snapshot = await firebaseFireStore.collection('AppUser').doc(id).get();
      print('Current app User Data: ${snapshot.data()}');
      return AppUser.fromJson(snapshot.data(), snapshot.id);
    } catch (e) {
      print('Exception @DatabaseService/getUser $e');
      return AppUser();
    }
  }
 

    ///
  /// Add user
  ///
  registerUser(AppUser appUser) {
    try {
      firebaseFireStore
          .collection("AppUser")
          .doc(appUser.appUserId)
          .set(appUser.toJson());
    } catch (e) {
      print('Exception $e');
    }
  }
  }
