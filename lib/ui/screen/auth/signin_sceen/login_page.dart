
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_login_ui/common/theme_helper.dart';
// import 'package:flutter_login_ui/pages/youtube.dart';
// import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
// import 'package:provider/provider.dart';
// import '../../../../core/enums/view_state.dart';
// import '../../forgot_password/forgot_password_page.dart';
// import '../../../../pages/profile_page.dart';
// import '../../../../pages/registration_page.dart';
// import '../../widgets/header_widget.dart';
// import 'signIn_provider.dart';

// class LoginPage extends StatefulWidget{
//   const LoginPage({Key? key}): super(key:key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage>{
//   double _headerHeight = 250;
//   Key _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//  return ChangeNotifierProvider(create: (context) {
//       return SignInProvider();
//     }, child: Consumer<SignInProvider>(builder: (context, model, child) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body:  ModalProgressHUD(
//         progressIndicator: CircularProgressIndicator(
//           color: Colors.blue,
//         ),
//         inAsyncCall: model.state == ViewState.busy,
//         child: SingleChildScrollView(
//           child: Column(
//             children: [
//               Container(
//                 height: _headerHeight,
//                 child: HeaderWidget(_headerHeight, true, Icons.login_rounded), //let's create a common header widget
//               ),
//               SafeArea(
//                 child: Container( 
//                   padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
//                     margin: EdgeInsets.fromLTRB(20, 10, 20, 10),// This will be the login form
//                   child: Column(
//                     children: [
//                       Text(
//                         'Cibil',
//                         style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
//                       ),
//                       Text(
//                         'Signin into your account',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                       SizedBox(height: 30.0),
//                       Form(
//                         key: model.formKey,
//                           child: Column(
//                             children: [
//                               Container(
//                                 child: TextFormField(
//                                   onChanged: (value){
//                                     model.appUser.userEmail=value;
//                                   },
//                                    validator: (value) {
//                                   if (value == null || value.isEmpty) {
//                                     return "Email can't be empty";
//                                   }
//                                   if (!value.contains("@")) {
//                                     return "Enter valid email";
//                                   }
//                                 },
//                                   decoration: ThemeHelper().textInputDecoration('Email Address', 'Enter your user Email'),
//                                 ),
//                                 decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                               ),
//                               SizedBox(height: 30.0),
//                               Container(
                                
//                                 child: TextFormField(
//                                   validator: (value) {
//                                 if (value == null || value.isEmpty) {
//                                   return "Password can't be empty";
//                                 }
//                                 if (value.length < 6) {
//                                   return "Password length must be 6 characters";
//                                 }
//                               },
//                                    onChanged: (value){
//                                     model.appUser.userPassword=value;
//                                   },
//                                   obscureText: true,
//                                   decoration: ThemeHelper().textInputDecoration('Password', 'Enter your password'),
//                                 ),
//                                 decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                               ),
//                               SizedBox(height: 15.0),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(10,0,10,20),
//                                 alignment: Alignment.topRight,
//                                 child: GestureDetector(
//                                   onTap: () {
//                                     Navigator.push( context, MaterialPageRoute( builder: (context) => ForgotPasswordPage()), );
//                                   },
//                                   child: Text( "Forgot your password?", style: TextStyle( color: Colors.grey, ),
//                                   ),
//                                 ),
//                               ),
//                               Container(
//                                 decoration: ThemeHelper().buttonBoxDecoration(context),
//                                 child: ElevatedButton(
//                                   style: ThemeHelper().buttonStyle(),
//                                   child: Padding(
//                                     padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
//                                     child: Text('Sign In'.toUpperCase(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
//                                   ),
//                                   onPressed: (){
//                                     //After successful login we will redirect to profile page. Let's create profile page now
//                                     // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => YoutubePlay()));
//                                     model.loginToApp(model.appUser, context);
//                                   },
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.fromLTRB(10,20,10,20),
//                                 //child: Text('Don\'t have an account? Create'),
//                                 child: Text.rich(
//                                   TextSpan(
//                                     children: [
//                                       TextSpan(text: "Don\'t have an account? "),
//                                       TextSpan(
//                                         text: 'Create',
//                                         recognizer: TapGestureRecognizer()
//                                           ..onTap = (){
//                                             Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationPage()));
//                                           },
//                                         style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).accentColor),
//                                       ),
//                                     ]
//                                   )
//                                 ),
//                               ),
//                             ],
//                           )
//                       ),
//                     ],
//                   )
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }));
//   }
// }