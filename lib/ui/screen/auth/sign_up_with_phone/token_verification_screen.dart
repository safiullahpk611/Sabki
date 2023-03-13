import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_login_ui/ui/screen/bottom_navigationbar/bottom_navigationbar.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../../../../core/enums/view_state.dart';
import '../../widgets/custom_sign_button.dart';
import 'signup_with_phone_provider.dart';

class TokenVerificationScren extends StatefulWidget {
  final verificationId;
  const TokenVerificationScren({super.key,this.verificationId});

  @override
  State<TokenVerificationScren> createState() => _TokenVerificationScrenState();
}

class _TokenVerificationScrenState extends State<TokenVerificationScren> {
    final authInstant = FirebaseAuth.instance;
  bool loading = false;
  TextEditingController verifiyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInWithPhoneNumberProvider(),
      child: Consumer<SignInWithPhoneNumberProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'verification',
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
                        "Enter cerification code",
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
                            controller: verifiyController,
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'verifiacation code',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                  
                       
                          
                        
                      
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: InkWell(
                          onTap: () async{
                            setState(() {
                              loading=true;
                            });
                         final credential=  PhoneAuthProvider.credential(verificationId: widget.verificationId, 
                         smsCode: verifiyController.text.toString());
                         try{
await authInstant.signInWithCredential(credential);

Get.offAll(myBottomNavigationBar());
                         }catch (e){
setState(() {
  loading=false;
});
  Get.showSnackbar(
                                  GetSnackBar(
                                    message: '${e.toString()}',
                                    duration: const Duration(seconds: 3),
                                  ),
                                );
                                print(">>>>>>>>>>>> ${e.toString()}");
                         }
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