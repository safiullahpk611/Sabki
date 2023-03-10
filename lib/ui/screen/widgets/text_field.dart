import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  final hintText;
  final onPress;
  final controller;
  final validator;
  const CustomTextFields(
      {super.key,
      this.hintText,
      this.onPress,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextFormField(
            validator: validator,
            onChanged: onPress,
            controller: controller,
            decoration: InputDecoration(
                // filled: true,
                // fillColor: Colors.white,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(color: Color.fromARGB(90, 35, 35, 0))),
          ),
        ),
      ),
    );
  }
}
