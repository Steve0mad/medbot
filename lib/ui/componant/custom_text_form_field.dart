import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  InputDecoration? decoration;
  TextEditingController controller;
  TextInputType? keyboardType;
 String? Function(String?)? validation;
   CustomTextFormField({this.decoration,this.keyboardType,required this.controller,required this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
    decoration: decoration,
    controller: controller ,
      validator: validation,
    );
  }
}
