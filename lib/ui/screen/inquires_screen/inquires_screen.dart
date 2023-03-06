import 'package:flutter/material.dart';

class InquiresScreen extends StatefulWidget {
  const InquiresScreen({Key? key}) : super(key: key);

  @override
  State<InquiresScreen> createState() => _InquiresScreenState();
}

class _InquiresScreenState extends State<InquiresScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Inquires Screen")),
    );
  }
}
