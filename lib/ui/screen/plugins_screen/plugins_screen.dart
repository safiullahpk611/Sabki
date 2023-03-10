import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/plugins_screen/plugins_screen_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../core/locator.dart';
import '../../../core/services/auth_Services.dart';
import '../widgets/custom_appbar.dart';

class PluginsScreen extends StatefulWidget {
  const PluginsScreen({Key? key}) : super(key: key);

  @override
  State<PluginsScreen> createState() => _PluginsScreenState();
}

class _PluginsScreenState extends State<PluginsScreen> {
     final locateUser = locator<AuthServices>();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return PluginsScreenProvider();
      },
      child: Consumer<PluginsScreenProvider>(builder: (context, model, child) {
        return Scaffold(
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
              child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),

                  /// Custom Appbar =====>>>
                  ///
                  CustomAppbar(title: locateUser.appUser.userName,),
                  SizedBox(
                    height: 10,
                  ),

                  /// Active Users Container ====>>>
                  ///
                  Text(
                    "Plugins",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins-Light')),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
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
                              "Find",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: model.value == 0
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 15,
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
                              "Install",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: model.value == 1
                                      ? Colors.white
                                      : Colors.black),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  model.value == 0
                      ? Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 1,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              "assets/icons/image 6.png",
                                            ),
                                            fit: BoxFit.fill,
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Cont Form",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            'Poppins-Light')),
                                              ),
                                              Text(
                                                "@amicoco",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            'Poppins-Light')),
                                              ),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.more_vert_outlined,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Text(
                                          "The best WordPress contact form plugin. Drag & Drop online form builder that helps you.",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily: 'Poppins-Light')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : model.value == 1
                          ?  Expanded(
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 1,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.9),
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                  padding: EdgeInsets.all(12),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                              "assets/icons/gridview.png",
                                            ),
                                            fit: BoxFit.fill,
                                            height: 25,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Cont Form",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontFamily:
                                                            'Poppins-Light')),
                                              ),
                                              Text(
                                                "@amicoco",
                                                style: GoogleFonts.poppins(
                                                    textStyle: TextStyle(
                                                        color: Colors.blueGrey,
                                                        fontSize: 9,
                                                        fontFamily:
                                                            'Poppins-Light')),
                                              ),
                                            ],
                                          ),
                                          Expanded(child: SizedBox()),
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.more_vert_outlined,
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5, vertical: 5),
                                        child: Text(
                                          "The best WordPress contact form plugin. Drag & Drop online form builder that helps you.",
                                          style: GoogleFonts.poppins(
                                              textStyle: TextStyle(
                                                  fontSize: 11,
                                                  fontFamily: 'Poppins-Light')),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                          : SizedBox(),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
