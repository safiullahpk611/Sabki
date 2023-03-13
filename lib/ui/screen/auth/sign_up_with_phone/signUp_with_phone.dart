import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/auth/sign_up_with_phone/token_verification_screen.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_sign_button.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_textfield.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../core/enums/view_state.dart';
import 'signup_with_phone_provider.dart';

class SignUpWithPhone extends StatefulWidget {
  @override
  State<SignUpWithPhone> createState() => _SignUpWithPhoneState();
}

class _SignUpWithPhoneState extends State<SignUpWithPhone> {
  // const ResetPasswordScreen({ Key? key }) : super(key: key);
  @override
  final authInstant = FirebaseAuth.instance;
  bool loading = false;
  TextEditingController phoneNoController = TextEditingController();
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInWithPhoneNumberProvider(),
      child: Consumer<SignInWithPhoneNumberProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'SignUp with Phone',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
              centerTitle: false,
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Form(
                  key: model.formKey,
                  child: Column(
                    children: [
                      Spacer(),
                      Text(
                        "Enter phone",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 40),
                      Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            controller: model.phoneNoController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Enter Your Phone',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                  
                       
                          
                        
                      
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: InkWell(
                          onTap: ()async {
                         await   authInstant.verifyPhoneNumber(
                              phoneNumber: phoneNoController.toString(),
                              verificationCompleted: (_) {
                                setState(() {
                                  loading = true;
                                });
                              },
                              verificationFailed: (e) {
                                setState(() {
                                  loading = false;
                                  print("??????????????? ${e.toString()}");
                                });
                                Get.showSnackbar(
                                  GetSnackBar(
                                    message: '${e.toString()}',
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              },
                              codeSent: (String verificationId, int? token) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            TokenVerificationScren(
                                              verificationId: verificationId,
                                            )));
                              },
                              codeAutoRetrievalTimeout: (e) {
                                setState(() {
                                  loading = false;
                                  
                                });
                                print("Time out  ${e.toString}");
                                Get.showSnackbar(
                                  GetSnackBar(
                                    message: '${e.toString()}',
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                              },
                            );
                          },
                          child: CustomSignButton(
                            loading: loading,
                            buttonName: "SignIn",
                            textColor: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ]
                  ),
                ),
              ),
            ),
          ),
   
    )));
  }
}
