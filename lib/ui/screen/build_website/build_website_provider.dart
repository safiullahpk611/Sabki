import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/core/models/base_view_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../edit_profile/edit_profile.dart';
import '../widgets/custom_sign_button.dart';
import 'build_website.dart';

class BuildWebsiteProvider extends BaseViewModal {
  final PageController controller = PageController(initialPage: 0);
  BestTutorSite site = BestTutorSite.javatpoint;
  int radio = 0;
  radioBoxVa(val) {
    radio = val;
    notifyListeners();
  }

  final List<Map<String, String>> onboardingData = [
    {'image': 'assets/images/Rectangle 183.png'},
    {'image': 'assets/images/Rectangle 183.png'},
    {'image': 'assets/images/Rectangle 183.png'},
  ];
  double currentPage = 0;

  void nextPage() {
    controller.nextPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  void previousPage() {
    controller.previousPage(
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  onChangedFunc(double a) {
    currentPage = a;
    notifyListeners();
  }

  int selectedOption = 0;

  final List<String> options = [
    'Option 1',
    'Option 2',
    'Option 3',
  ];

  void handleRadioValueChanged(int value) {
    selectedOption = value;
  }

  showDiaLog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (contex) => EditProfile()));
                  })
            ],
          ),
        );
      },
    );
  }
}
