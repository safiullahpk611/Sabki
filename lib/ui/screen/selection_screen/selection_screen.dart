import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../auth/signin_sceen/login_screen.dart';
import '../get_started/get_started.dart';
import '../widgets/custom_sign_button.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.black,
      child: Column(children: [
        Expanded(
            child: Container(
          width: double.infinity,
          child:
              Center(child: SvgPicture.asset('assets/images/Sabki.site.svg')),
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(right: 10, left: 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 3,
                    width: 30,
                    color: Colors.grey,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height / 15),
                  Text(
                    'Grow Your Business From Anywhere',
                    style: TextStyle(fontFamily: 'Poppins-Light', fontSize: 27),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    'Hello again , you’ve been missed',
                    style: TextStyle(fontFamily: 'Poppins-Light', fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                  CustomSignButton(
                    textColor: Colors.white,
                    buttonName: 'Get Started',
                    buttoncolor: Colors.black,
                    onPress: (){
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>GetStartedScreen()));
                      
                    },
                  ),
                  SizedBox(height: 15,),
                   CustomSignButton(
                    buttoncolor: Colors.black,
                      textColor: Colors.white,
                    buttonName: 'Login',
                    onPress: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                    },
                  )
                ]),
          ),
        )),
      ]),
    ));
  }
}



// class MyBottomSheet extends StatefulWidget {
//   @override
//   _MyBottomSheetState createState() => _MyBottomSheetState();
// }

// class _MyBottomSheetState extends State<MyBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return 
//       Container(
//         height: 200,
//         child: Center(
//           child: Text('My Bottom Sheet'),
//         ),
//       ),
//     );
//   }
// }


//
//     Text('Grow Your Business From Anywhere',style: TextStyle(fontFamily: 'Poppins-Light',fontSize: 27),),