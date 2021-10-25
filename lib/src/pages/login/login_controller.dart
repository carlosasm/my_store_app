import 'package:flutter/material.dart';

class LoginController{

  late BuildContext context;
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Future? init(BuildContext context){
    this.context = context;
  }

  Future? onDispose(BuildContext context){
    emailController.dispose();
    passwordController.dispose();
  }

  void goToRegisterPage(){
    Navigator.pushNamed(context, 'register');
  }

  void login(){
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    print(email);
    print(password);
  }
}