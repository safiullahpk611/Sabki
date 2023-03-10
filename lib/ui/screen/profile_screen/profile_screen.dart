import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/profile_screen/profile_screen_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../core/locator.dart';
import '../../../core/services/auth_Services.dart';
import '../build_website/build_website.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int value = 0;

  getValue(int x) {
    value = x;
  }

  @override
  final locateUser = locator<AuthServices>();
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return ProfileScreenProvider();
      },
      child: Consumer<ProfileScreenProvider>(builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(actions: [
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: InkWell(
                  onTap: () {
                    model.logout(context);
                  },
                  child: Icon(Icons.login_outlined)),
            )
          ]),
          body: Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/wallpaper (4).png"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.07), BlendMode.dstATop),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),

                    /// Custom Appbar =====>>>
                    CustomAppbar(
                      title: '${locateUser.appUser.userName}',
                    ),
                    SizedBox(
                      height: 30,
                    ),

                    ///
                    ///   Profile Screen Tabs ==========>>>>
                    ///
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ///
                            ///    General view Screen ==================>>>
                            ///
                            InkWell(
                              onTap: () {
                                model.getValue(0);
                              },
                              child: Container(
                                height: 32,
                                width: 75,
                                decoration: model.value == 0
                                    ? BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                    : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                child: Center(
                                    child: Text(
                                  "General",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: model.value == 0
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),

                            ///
                            ///    Password view Screen ==================>>>
                            ///
                            InkWell(
                              onTap: () {
                                model.getValue(1);
                              },
                              child: Container(
                                height: 32,
                                width: 75,
                                decoration: model.value == 1
                                    ? BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                    : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                child: Center(
                                    child: Text(
                                  "Password",
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: model.value == 1
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),

                            ///
                            ///    Information view Screen ==================>>>
                            ///
                            InkWell(
                              onTap: () {
                                model.getValue(2);
                              },
                              child: Container(
                                height: 32,
                                width: 80,
                                decoration: model.value == 2
                                    ? BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                    : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                child: Center(
                                    child: Text(
                                  "Information",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: model.value == 2
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),

                            ///
                            ///    Information view Screen ==================>>>
                            ///
                            InkWell(
                              onTap: () {
                                model.getValue(3);
                              },
                              child: Container(
                                height: 32,
                                width: 70,
                                decoration: model.value == 3
                                    ? BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      )
                                    : BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                child: Center(
                                    child: Text(
                                  "Social",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: model.value == 3
                                          ? Colors.white
                                          : Colors.black),
                                )),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 25),

                        /// Tabs Screens   =========>>>
                        ///
                        model.value == 0
                            ? Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/profile.png',
                                          height: 100,
                                        ),
                                        Expanded(
                                          child: SizedBox(),
                                        ),

                                        /// Upload Container
                                        Container(
                                            height: 30,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text("Upload",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                  )),
                                            )),
                                        SizedBox(
                                          width: 10,
                                        ),

                                        /// Reset Container
                                        Container(
                                            height: 30,
                                            width: 75,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            child: Center(
                                              child: Text("Reset",
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.black,
                                                  )),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),

                                    /// Username Textfield
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Username",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins-Light')),
                                      ),
                                    ),
                                    CustomTextFields(hintText: "Jinni"),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Email",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins-Light')),
                                      ),
                                    ),
                                    CustomTextFields(
                                        hintText: "granger007@hogward"),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Text(
                                        "Company",
                                        style: GoogleFonts.poppins(
                                            textStyle: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                fontFamily: 'Poppins-Light')),
                                      ),
                                    ),
                                    CustomTextFields(hintText: "User123"),
                                  ],
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                ),
                              )
                            : model.value == 1
                                ? Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 20,
                                        ),

                                        /// Old Password Textfield
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            "Old Password",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        'Poppins-Light')),
                                          ),
                                        ),
                                        CustomTextFields(
                                            hintText:
                                                "Enter Your Old Password"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            "New Password",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        'Poppins-Light')),
                                          ),
                                        ),
                                        CustomTextFields(
                                            hintText:
                                                "Enter Your New Password"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            "Retype New Password",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        'Poppins-Light')),
                                          ),
                                        ),
                                        CustomTextFields(
                                            hintText:
                                                "Enter Your New Password again"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 15),
                                          child: Text(
                                            "Email",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w500,
                                                    fontFamily:
                                                        'Poppins-Light')),
                                          ),
                                        ),
                                        CustomTextFields(
                                            hintText: "Enter Your mail"),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
                                  )
                                : model.value == 2
                                    ? Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),

                                            /// Business Short Description Textfield
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child: Text(
                                                "Business Short Description",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            'Poppins-Light')),
                                              ),
                                            ),

                                            Container(
                                              height: 130,
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 15),
                                                child: TextFormField(
                                                  decoration: InputDecoration(
                                                    // filled: true,
                                                    // fillColor: Colors.white,
                                                    border: InputBorder.none,
                                                    hintText:
                                                        "Enter Business Short Description",
                                                  ),
                                                ),
                                              ),
                                            ),

                                            /// Country Name Textfield
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                "Country Name",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            'Poppins-Light')),
                                              ),
                                            ),
                                            CustomTextFields(
                                                hintText: "Enter Country Name"),

                                            /// Phone No Textfield
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                "Phone No",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            'Poppins-Light')),
                                              ),
                                            ),
                                            CustomTextFields(
                                                hintText:
                                                    "Enter your Phone No"),
                                            SizedBox(
                                              height: 20,
                                            ),

                                            /// Date of Birth Textfield
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                "Date of Birth",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            'Poppins-Light')),
                                              ),
                                            ),
                                            CustomTextFields(
                                                hintText:
                                                    "Enter Date of Birth"),
                                            SizedBox(
                                              height: 20,
                                            ),
                                          ],
                                        ),
                                      )
                                    : model.value == 3
                                        ? Container(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 20,
                                                ),

                                                /// Instagram Textfield
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Text(
                                                    "Instagram",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Poppins-Light')),
                                                  ),
                                                ),
                                                CustomTextFields(
                                                    hintText:
                                                        "Enter your Instagram URL"),

                                                /// Facebook Textfield
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Text(
                                                    "Facebook",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Poppins-Light')),
                                                  ),
                                                ),
                                                CustomTextFields(
                                                    hintText:
                                                        "Enter your Facebook URL"),

                                                /// Twitter Textfield
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Text(
                                                    "Twitter",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Poppins-Light')),
                                                  ),
                                                ),
                                                CustomTextFields(
                                                    hintText:
                                                        "Enter your Twitter URL"),

                                                /// Youtube Textfield
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Text(
                                                    "Youtube",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Poppins-Light')),
                                                  ),
                                                ),
                                                CustomTextFields(
                                                    hintText:
                                                        "Enter your Youtube URL"),

                                                /// Whatsapp Textfield
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child: Text(
                                                    "Whatsapp",
                                                    style: GoogleFonts.poppins(
                                                        textStyle: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontFamily:
                                                                'Poppins-Light')),
                                                  ),
                                                ),
                                                CustomTextFields(
                                                    hintText:
                                                        "Enter your Whatsapp URL"),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          )
                                        : SizedBox(),

                        /// Update Profile Button
                        ///
                        SizedBox(height: 35),
                        Center(
                          child: Container(
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.black,
                            ),
                            child: Center(
                              child: Text(
                                "Update Profile ",
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'Poppins-Light')),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
