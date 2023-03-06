import 'package:firebase_auth/firebase_auth.dart';

import '../models/appUser.dart';
import 'auth_exception_message.dart';
import 'custom_auth_result.dart';
import 'database_services.dart';

class AuthServices {
  final databaseServices = DatabaseServices();
  final customAuthResult = CustomAuthResult();
  final authInstant = FirebaseAuth.instance;
  bool? isLogin;
  User? user;
  AppUser appUser = AppUser();
  //VehicleDetailModel vehicleDetailModel = VehicleDetailModel();

  AuthServices() {
    print("intit is calling");
   // init();
  }


  init() async {
 
  }
    ///
  Future<CustomAuthResult> loginUser(AppUser appUser) async {
    print("App user email: ${appUser.userEmail}");
    print("App user Password: ${appUser.userPassword}");

    try {
      final credentials = await authInstant.signInWithEmailAndPassword(
        email: appUser.userEmail!,
        password: appUser.userPassword!,
      );
      print("===========>>> User logined Successfully");
      if (credentials.user != null) {
        customAuthResult.user = credentials.user;
        print("custom auth result ${customAuthResult.user}");
        this.appUser = appUser;
        this.appUser.appUserId = credentials.user!.uid;
        this.isLogin = true;
    

        ///
        /// Get User ===========================>>>>
        ///
        // this.appUser = await databaseServices.getUsers(credentials.user!.uid);
          this.appUser = await databaseServices.getUser(credentials.user!.uid);

        //vehicleDetailModel = await databaseServices.getVehicleDetail(credentials.user!.uid);
      }
    } catch (e) {
      print('Exception@LoginUser $e');
      customAuthResult.errorMessage =
          AuthExceptionsMessages.generateExceptionMessage(e);
    }
    return customAuthResult;
  }


  ///
  ///signUp user

  Future<CustomAuthResult> signUpUser(AppUser appUser) async{
    try{
      final credential = await authInstant.createUserWithEmailAndPassword(
          email: appUser.userEmail!,
          password: appUser.userPassword!
      );
      if(credential.user != null){
        print('user registered');
        this.appUser = appUser;
        this.appUser.appUserId = credential.user!.uid;
        this.isLogin = true;
        print("SignUpUserId=> ${this.appUser.appUserId}");
        await databaseServices.registerUser(appUser);
        this.appUser = await databaseServices.getUser(credential.user!.uid);
        customAuthResult.user = credential.user;
      }
    }
    catch(e){
      print('Exception@signUpUser $e');
      customAuthResult.errorMessage = AuthExceptionsMessages.generateExceptionMessage(e);
    }
    return customAuthResult;
  }
  

  // //


  ///
  /// Login User  ===================================>>>


  ///
  /// logout ==================================>>>
  ///
  Future<void> logoutUser() async {
  
    await authInstant.signOut();
    this.isLogin = false;
    this.appUser = AppUser();
    this.user = null;

    print("==========>>> User logout Successfully....");
  }
}
