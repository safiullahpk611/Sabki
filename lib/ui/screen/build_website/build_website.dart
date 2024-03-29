import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/build_website/build_website_provider.dart';
import 'package:flutter_login_ui/ui/screen/get_started/get_started.dart';
import 'package:flutter_login_ui/ui/screen/widgets/custom_sign_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../edit_profile/edit_profile.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class BuildWebsite extends StatefulWidget {
  BuildWebsite({super.key});

  @override
  State<BuildWebsite> createState() => _BuildWebsiteState();
}

class _BuildWebsiteState extends State<BuildWebsite> {
  @override
  int selectedOption = 0;

  final List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  void _handleRadioValueChanged(int value) {
    selectedOption = value;
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return BuildWebsiteProvider();
      },
      child: Consumer<BuildWebsiteProvider>(builder: (context, model, child) {
        return Scaffold(
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wallpaper (4).png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.07), BlendMode.dstATop),
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.10),
                          Center(
                              child: SvgPicture.asset(
                                  'assets/images/Sabki.site (3).svg')),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.05),
                          Text(
                            "Make a Website with Sabki.site",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 27,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins-Light'),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.06),
                          Text(
                            "Sabki.site Website Maker combines your logo design preferences with Artificial Intelligence"
                            "to help you create a custom logo you'll love. All it takes is a few clicks and five minutes.",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  fontFamily: 'Poppins-Light'),
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextFields(
                            hintText: 'Enter your Busness Name',
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25),
                            child: CustomSignButton(
                                textColor: Colors.black,
                                buttoncolor: Colors.white,
                                buttonName: 'Next',
                                onPress: () {
                                 myFunc(context);
                                }),
                          ),
                        ]),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 200,
                    child: PageView.builder(
                      controller: model.controller,
                      itemCount: model.onboardingData.length,
                      onPageChanged: (int page) {
                        model.onChangedFunc(page.toDouble());
                      },
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    model.previousPage();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: model.currentPage == 0
                                        ? Colors.grey
                                        : Colors.black,
                                  )),
                            ),
                            Expanded(
                              flex: 7,
                              child: Container(
                                decoration: BoxDecoration(boxShadow: [
                                  //BoxShadow
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 6.0,
                                    spreadRadius: 0.5,
                                    offset: Offset(0.0, 0.0),
                                  ) //BoxShadow
                                ], borderRadius: BorderRadius.circular(7)),
                                child: Image.asset(
                                  '${model.onboardingData[index]['image']}',
                                  height: 200,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                  onPressed: () {
                                    model.currentPage ==
                                            model.onboardingData.length - 1
                                        ? () {}
                                        : model.nextPage();
                                  },
                                  icon: Icon(Icons.arrow_forward_ios)),
                            )
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

myFunc(BuildContext context) {
 return  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
        
      children: [
            Text(
              'The domain you select will be your site\'s address',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins-Light'),
              ),
              textAlign: TextAlign.center,
            ),
            CustomTextFields(
              hintText: 'www.google.com',
            ),
            CustomTextFields(
              hintText: 'For example connect www.mystunningwebsite.com',
            ),
            CustomSignButton(
                textColor: Colors.white,
                buttonName: 'Build now',
                buttoncolor: Colors.black,
                onPress: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (contex) => EditProfile()));
                })
        ]),
      );
            
         
    },
  );
}

class CustomTextFields extends StatelessWidget {
  final hintText;
  const CustomTextFields({
    super.key,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextFormField(
            decoration: InputDecoration(
              // filled: true,
              // fillColor: Colors.white,
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(color: Color.fromARGB(64, 64, 64, 3))
            ),
          ),
        ),
      ),
    );
  }
}
