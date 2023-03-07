import 'package:flutter/material.dart';

class CustomSignTextfield extends StatelessWidget {
  final hintText;
  final suffixIcon;
  final obsecureText;
  final controller;
  final onChanged;
  final validator;
  const CustomSignTextfield(
      {this.onChanged,
        this.controller,
        this.hintText,
        this.validator,
        this.suffixIcon,
        super.key,
        this.obsecureText = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          obscureText: obsecureText,
          onChanged: onChanged,
          validator: validator,
          controller: controller,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.white),
            suffixIcon: suffixIcon,
          ),
        ),
      ),
    );
  }
}