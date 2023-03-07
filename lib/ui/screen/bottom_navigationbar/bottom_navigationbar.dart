import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/inquires_screen/inquires_screen.dart';
import 'package:flutter_login_ui/ui/screen/more_screen/more_screen.dart';
import 'package:flutter_login_ui/ui/screen/plugins_screen/plugins_screen.dart';

import '../home_screen/home_screen.dart';
import '../profile_screen/profile_screen.dart';

class myBottomNavigationBar extends StatefulWidget {
  const myBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<myBottomNavigationBar> createState() => _myBottomNavigationBarState();
}

class _myBottomNavigationBarState extends State<myBottomNavigationBar> {

  int _page = 2;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  /// Called Screens by Bottom Navigation Bar ===>>>
  ///
  final _widgetOptions = [
    ProfileScreen(),
    InquiresScreen(),
    HomeScreen(),
    PluginsScreen(),
    MoreScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 2,
          height: 60.0,
          items: <Widget>[
            Icon(Icons.person, size: 22,color: Colors.white),
            Icon(Icons.comment_bank, size: 22,color: Colors.white),
            Icon(Icons.home, size: 22,color: Colors.white),
            Icon(Icons.call_split, size: 22,color: Colors.white),
            Icon(Icons.more_horiz, size: 22,color: Colors.white),
          ],
          color: Colors.black,
          buttonBackgroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Center(
        child: _widgetOptions.elementAt(_page),
    ));
  }
}
