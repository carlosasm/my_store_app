import 'package:flutter/material.dart';
import 'package:my_store/src/utils/theme_provider.dart';

class CustomTextField extends StatelessWidget {

  final String hintText;
  final Icon icon;
  final TextInputType textInputType;
  final TextEditingController controller;

  const CustomTextField({
    required this.hintText, 
    required this.icon,
    required this.textInputType,
    required this.controller
  }) : super();

  @override
  Widget build(BuildContext context) {
    return _textFieldEmail();
  }

  Widget _textFieldEmail() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
      decoration: BoxDecoration(
        color: MyColors.primaryOpacityColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(15),
          hintStyle: TextStyle(color: MyColors.primaryColorDark),
          prefixIcon: icon,
        ),
      ),
    );
  }
  
}