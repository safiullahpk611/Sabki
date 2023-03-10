import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/locator.dart';
import '../../../core/services/auth_Services.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({Key? key}) : super(key: key);

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final locateUser = locator<AuthServices>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/wallpaper (4).png"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.07), BlendMode.dstATop),
          ),
        ),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.black,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/profile.png',
                          height: 90,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Hello",style: TextStyle(color: Colors.white,fontSize: 25),),
                            Text(
                              "Jinni",
                              style: TextStyle(color: Colors.white,fontSize: 30
                            ),),
                          ],
                        ),
                        Expanded(child: SizedBox()),
                        Icon(
                          Icons.notifications_on,
                          color: Colors.white,
                          size: 25,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 0),
              child: Row(
                children: [
                  Text(
                    "Themes",
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Poppins-Light')),
                  ),
                  Expanded(child: SizedBox()),
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 25,
                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            ///Theme Gridview ======>>>
            ///
            Expanded(
              child: GridView.builder(
                gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 1,
                    crossAxisSpacing: 1,
                    crossAxisCount: 2,
                    childAspectRatio: 0.7),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                          BorderRadius.all(Radius.circular(8))),
                      child: Column(
                        children: [
                          Image(
                            image: AssetImage(
                              "assets/images/themepic.png",
                            ),
                            height: 120,
                          ),
                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Siptra vibe",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 14,
                                              fontWeight:
                                              FontWeight.w500,
                                              fontFamily:
                                              'Poppins-Light')),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(child: SizedBox()),
                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.more_vert_outlined,size: 15,
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
          ],
        ),
      ),
    );
  }
}
