import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_appbar.dart';

class InquiresScreen extends StatefulWidget {
  const InquiresScreen({Key? key}) : super(key: key);

  @override
  State<InquiresScreen> createState() => _InquiresScreenState();
}

class _InquiresScreenState extends State<InquiresScreen> {
  @override
  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),

              /// Custom Appbar =====>>>
              ///
              CustomAppbar(),
              SizedBox(
                height: 10,
              ),

              /// Active Users Container ====>>>
              ///
              Text(
                "Inquires",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Poppins-Light')),
              ),
              SizedBox(
                height: 10,
              ),

              Expanded(
                child: ListView.builder(

                  padding: EdgeInsets.all(5),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  //controller: model.scrollController,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    print("==========>>>>");
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
                                    "assets/icons/profile.png",
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
                                      "Beverlie Krabbe",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              color: Colors.blue,
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
                                              color:
                                                  Colors.blueGrey,
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
                            SizedBox(height: 5,),

                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                              child: Text("Hello, I'm interested in learning more about your product/service. Can you provide me with more information on pricing and features?",style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                      fontSize: 10,
                                      fontFamily:
                                      'Poppins-Light')),),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
