// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:provider/provider.dart';

// import '../../../../common/theme_helper.dart';
// import '../../widgets/header_widget.dart';
// import 'sign_up_provider.dart';
// class SignUpScreen extends StatelessWidget {
// SignUpScreen({super.key});
//   bool checkedValue = false;
//   bool checkboxValue = false;
//   @override
//   Widget build(BuildContext context) {
//      return ChangeNotifierProvider(create: (context) {
//       return SignUpProvider();
//     }, child: Consumer<SignUpProvider>(builder: (context, model, child) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Stack(
//           children: [
//             Container(
//               height: 150,
//               child: HeaderWidget(150, false, Icons.person_add_alt_1_rounded),
//             ),
//             Container(
//               margin: EdgeInsets.fromLTRB(25, 50, 25, 10),
//               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
//               alignment: Alignment.center,
//               child: Column(
//                 children: [
//                   Form(
//                     key: model.formKey,
//                     child: Column(
//                       children: [
//                         GestureDetector(
//                           child: Stack(
//                             children: [
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(100),
//                                   border: Border.all(
//                                       width: 5, color: Colors.white),
//                                   color: Colors.white,
//                                   boxShadow: [
//                                     BoxShadow(
//                                       color: Colors.black12,
//                                       blurRadius: 20,
//                                       offset: const Offset(5, 5),
//                                     ),
//                                   ],
//                                 ),
//                                 child: Icon(
//                                   Icons.person,
//                                   color: Colors.grey.shade300,
//                                   size: 80.0,
//                                 ),
//                               ),
//                               Container(
//                                 padding: EdgeInsets.fromLTRB(80, 80, 0, 0),
//                                 child: Icon(
//                                   Icons.add_circle,
//                                   color: Colors.grey.shade700,
//                                   size: 25.0,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 30,),
//                         Container(
//                           child: TextFormField(
//                             onChanged: (value){
//                               model.appUser.firstName=value;
//                             },
//                             decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 30,),
//                         Container(
//                           child: TextFormField(
//                               onChanged: (value){
//                               model.appUser.lastname=value;
//                             },
//                             decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name'),
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           child: TextFormField(
//                               onChanged: (value){
//                               model.appUser.userEmail=value;
//                             },
//                             decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
//                             keyboardType: TextInputType.emailAddress,
//                             validator: (val) {
//                               if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
//                                 return "Enter a valid email address";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           child: TextFormField(
//                               onChanged: (value){
//                               model.appUser.phoneNumber=value;
//                             },
//                             decoration: ThemeHelper().textInputDecoration(
//                                 "Mobile Number",
//                                 "Enter your mobile number"),
//                             keyboardType: TextInputType.phone,
//                             validator: (val) {
//                               if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
//                                 return "Enter a valid phone number";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 15.0),
//                         Container(
//                           child: TextFormField(
//                               onChanged: (value){
//                               model.appUser.userPassword=value;
//                             },
//                             obscureText: true,
//                             decoration: ThemeHelper().textInputDecoration(
//                                 "Password*", "Enter your password"),
//                             validator: (val) {
//                               if (val!.isEmpty) {
//                                 return "Please enter your password";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 10.0),
//                         FormField<bool>(
//                           builder: (state) {
//                             return Column(
//                               children: <Widget>[
//                                 Row(
//                                   children: <Widget>[
//                                     Checkbox(
//                                         value: model.checkboxValue,
//                                         onChanged: (value) {
                                        
//                                        model.changeCheckboxValue(value);
//                                             state.didChange(value);
                                            
                                       
//                                         }),
//                                     Text("I accept all terms and conditions.", style: TextStyle(color: Colors.grey),),
//                                   ],
//                                 ),
//                                 Container(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     state.errorText ?? '',
//                                     textAlign: TextAlign.left,
//                                     style: TextStyle(color: Theme.of(context).errorColor,fontSize: 12,),
//                                   ),
//                                 )
//                               ],
//                             );
//                           },
//                           validator: (value) {
//                             if (!checkboxValue) {
//                               return 'You need to accept terms and conditions';
//                             } else {
//                               return null;
//                             }
//                           },
//                         ),
                     
//                         Container(
//                           decoration: ThemeHelper().buttonBoxDecoration(context),
//                           child: ElevatedButton(
//                             style: ThemeHelper().buttonStyle(),
//                             child: Padding(
//                               padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
//                               child: Text(
//                                 "Register".toUpperCase(),
//                                 style: TextStyle(
//                                   fontSize: 20,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             onPressed: () {
//                             model.signUpUser(model.appUser, context);
//                             },
//                           ),
//                         ),
//                         SizedBox(height: 30.0),
//                         Text("Or create account using social media",  style: TextStyle(color: Colors.grey),),
//                         SizedBox(height: 25.0),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             GestureDetector(
//                               child: FaIcon(
//                                 FontAwesomeIcons.googlePlus, size: 35,
//                                 color: HexColor("#EC2D2F"),),
//                               onTap: () {
//                               model.showPop(context, "PluGoogles", "You tap on GooglePlus social icon.");
//                               },
//                             ),
//                             SizedBox(width: 30.0,),
//                             GestureDetector(
//                               child: Container(
//                                 padding: EdgeInsets.all(0),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(100),
//                                   border: Border.all(width: 5, color: HexColor("#40ABF0")),
//                                   color: HexColor("#40ABF0"),
//                                 ),
//                                 child: FaIcon(
//                                   FontAwesomeIcons.twitter, size: 23,
//                                   color: HexColor("#FFFFFF"),),
//                               ),
//                               onTap: () {
//                                 model.showPop(context, "Twitter","You tap on Twitter social icon.");
                               
                               
//                               },
//                             ),
//                             SizedBox(width: 30.0,),
//                             GestureDetector(
//                               child: FaIcon(
//                                 FontAwesomeIcons.facebook, size: 35,
//                                 color: HexColor("#3E529C"),),
//                               onTap: () {
//                                 model.showPop(context, "Facebook", "You tap on Facebook social icon.");
                                
                              
                                
//                               },
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }));
// }}