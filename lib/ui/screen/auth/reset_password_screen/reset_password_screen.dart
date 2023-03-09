import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_sign_button.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_textfield.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../../core/enums/view_state.dart';
import 'reset_password_provider.dart';

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
            appBar: AppBar(

              title: Text(
                'Reset Your password!',
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
                        "Enter your email",
                        style: TextStyle(fontSize: 20),
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
                        // decoration: textFormFieldDecoration.copyWith(
                        //   prefixIcon: Image.asset(
                        //     "assets/icons/email_icon.png",
                        //     scale: 1.2,
                        //   ),
                        // ),
                      ),
                      SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: InkWell(
                          onTap: () {
                            model.resetPassword(context);
                          },
                          child: CustomSignButton(
                            buttonName: "Reset Password",
                            textColor: Colors.white,
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
