import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({Key? key}) : super(key: key);

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
              "Jinni",
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        Expanded(child: SizedBox()),
        Icon(
          Icons.search,
          color: Colors.black,
          size: 25,
        )
      ],
    );
  }
}
