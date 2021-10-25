import 'package:flutter/material.dart';
import 'package:my_store/src/utils/theme_provider.dart';

class CustomButton extends StatelessWidget {
  
  final String text;
  final Function onPressed;

  const CustomButton({
    required this.text, 
    required this.onPressed
  }) : super();

  @override
  Widget build(BuildContext context) {
    return _buttonLogin();
  }

  Widget _buttonLogin() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
      child: ElevatedButton(
        onPressed: () => this.onPressed(),
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            padding: EdgeInsets.symmetric(vertical: 15)),
      ),
    );
  }

}