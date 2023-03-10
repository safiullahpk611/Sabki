import 'package:flutter/material.dart';
import 'package:flutter_login_ui/ui/screen/content_detail/content_detil.dart';

class CustomAppbar extends StatelessWidget {
  final title;
  const CustomAppbar({this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/icons/profile.png',
          height: 50,
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Hello"),
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Expanded(child: SizedBox()),
        IconButton(
        icon:  Icon(Icons.search,
          color: Colors.black,
          size: 25),
          onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ContentDetail()));
          },

        ),
      ],
    );
  }
}
