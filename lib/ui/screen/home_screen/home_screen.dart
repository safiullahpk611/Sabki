import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/custom_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),

                /// Custom Appbar =====>>>
                ///
                CustomAppbar(),
                SizedBox(
                  height: 30,
                ),

                /// Active Users Container ====>>>
                ///
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Image.asset(
                          "assets/icons/person.png",
                          height: 65,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "2343",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light')),
                          ),
                          Text(
                            "Total Active User",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18, fontFamily: 'Poppins-Light')),
                          ),
                        ],
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /// Active Users Container ====>>>
                ///
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Image.asset(
                          "assets/icons/website.png",
                          height: 65,
                        ),
                      ),
                      // SizedBox(
                      //   width: 25,
                      // ),
                      Column(
                        children: [
                          Text(
                            "1",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light')),
                          ),
                          Text(
                            "Total Active Websites",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18, fontFamily: 'Poppins-Light')),
                          ),
                        ],
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                /// Deactivate Users Container ====>>>
                ///
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Image.asset(
                          "assets/icons/person.png",
                          height: 65,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "0",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins-Light')),
                          ),
                          Text(
                            "Total Deactivate User",
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 18, fontFamily: 'Poppins-Light')),
                          ),
                        ],
                      ),
                      SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),

                /// Rating bar Container  =====>>>>
                ///
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 8),
                      chartRow(context, 'Jan', 89),
                      chartRow(context, 'Feb', 70),
                      chartRow(context, 'Mar', 65),
                      chartRow(context, 'Apr', 64),
                      chartRow(context, 'May', 75),
                      chartRow(context, 'Jun', 70),
                      chartRow(context, 'Jul', 65),
                      chartRow(context, 'Aug', 64),
                      chartRow(context, 'Sep', 75),
                      chartRow(context, 'Oct', 64),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget chartRow(BuildContext context, String label, int pct) {
    return Row(
      children: [
        Text(label),
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 5),
          child: Stack(children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(20)),
              child: Text(''),
            ),
            Container(
              width: MediaQuery.of(context).size.width * (pct / 100) * 0.7,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: Text(''),
            ),
          ]),
        ),
        Text('$pct%'),
      ],
    );
  }
}
