import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  InputDecoration? decoration;
  TextEditingController controller;
 String? Function(String?)? validation;
   CustomTextFormField({this.decoration,required this.controller,required this.validation});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
    decoration: decoration,
    controller: controller ,
      validator: validation,
    );
  }
}
