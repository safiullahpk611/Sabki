import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/forgot_password/forgot_password_provider.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../core/enums/view_state.dart';
import '../widgets/custom_sign_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  // const ResetPasswordScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResetPassswodProvider(),
      child: Consumer<ResetPassswodProvider>(
        builder: (context, model, child) => ModalProgressHUD(
          inAsyncCall: model.state == ViewState.busy,
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                'Reset Your password!',
                style: TextStyle(color: Colors.white),
              ),
              elevation: 0.0,
              centerTitle: true,
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
                        "Enter your email",
                        style: TextStyle(fontSize: 20,color: Colors.white),
                      ),
                      SizedBox(height: 40),
                      CustomSignTextfield(
                        hintText: 'Enter Email',
                        onChanged: (value) {
                          model.email = value.trim();
                        },
                        validator: (value) {
                          if (value!.isEmpty || !value.contains("@")) {
                            return "Please enter valid email";
                          }
                        },
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: InkWell(
                          onTap: () {
                            model.resetPassword(context);
                          },
                          child: CustomSignButton(
                            buttonName: "Reset Password",textColor: Colors.white,buttoncolor: Colors.blue,
                          ),
                        ),
                      ),
                      Spacer(
                        flex: 3,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
