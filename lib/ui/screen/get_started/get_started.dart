import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../../core/enums/view_state.dart';
import '../build_website/build_website.dart';
import '../widgets/custom_sign_button.dart';

class GetStartedScreen extends StatelessWidget {
  GetStartedScreen({super.key});
  final List<OnboardingItem> items = [
    OnboardingItem(
      'assets/images/Rectangle 183.png',
    ),
    OnboardingItem(
      'assets/images/Rectangle 183.png',
    ),
    OnboardingItem(
      'assets/images/Rectangle 183.png',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper (4).png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
          ),
        ),

        // color: Colors.black,
        child: Column(children: [
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                child: Center(
                    child:
                        SvgPicture.asset('assets/images/Sabki.site (2).svg')),
              )),
          Expanded(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(right: 10, left: 10),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                  color: Colors.black,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 3,
                            width: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                              height: MediaQuery.of(context).size.height / 15),
                          Text(
                            'Grow Your Business From Anywhere',
                            style: TextStyle(
                                fontFamily: 'Poppins-Light',
                                fontSize: 27,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.01),
                          Text(
                            'Hello again , you’ve been missed',
                            style: TextStyle(
                                fontFamily: 'Poppins-Light',
                                fontSize: 15,
                                color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.06),
                          Container(
                            child: Column(
                              children: [
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: PageView.builder(
                                    itemCount: items.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Column(
                                        children: [
                                          OnboardingItemWidget(items[index]),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: index == 0
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: index == 1
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10,
                                              ),
                                              Container(
                                                height: 8,
                                                width: 8,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: index == 2
                                                      ? Colors.white
                                                      : Colors.grey,
                                                ),
                                              )
                                            ],
                                          )
                                        ],
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          CustomSignButton(
                            textColor: Colors.black,
                            buttonName: 'Get Started',
                            buttoncolor: Colors.white,
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => BuildWebsite()));
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                        ]),
                  ),
                ),
              )),
        ]),
      ),
    );
  }
}

class OnboardingItem {
  final String imagePath;

  OnboardingItem(this.imagePath);
}

class OnboardingItemWidget extends StatelessWidget {
  final OnboardingItem item;

  OnboardingItemWidget(this.item);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [Image.asset(item.imagePath)],
      ),
    );
  }
}
