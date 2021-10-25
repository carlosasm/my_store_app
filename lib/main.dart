import 'package:flutter/material.dart';
import 'package:my_store/src/pages/login/login_page.dart';
import 'package:my_store/src/pages/register/register_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Delivery App',
      debugShowCheckedModeBanner: false,
      initialRoute: 'login',
      routes: {
        'login' : ( BuildContext context ) => LoginPage(),
        'register' : ( BuildContext context ) => RegisterPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
