import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:my_store/src/pages/login/login_controller.dart';
import 'package:my_store/src/utils/theme_provider.dart';
import 'package:my_store/src/widgets/custom_buttom.dart';
import 'package:my_store/src/widgets/custom_textfield.dart';
import 'package:my_store/src/widgets/custom_textfield_password.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
} 

class _LoginPageState extends State<LoginPage> {

  LoginController _textController = new LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _textController.init(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _textController.onDispose(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              child: Stack(
          children: [
            Positioned(
              top: -80,
              left: -100,
              child: _circleLogin(),
            ),
            Column(
              children: [
                //_imageBanner(),
                _animatedImage(),
                CustomTextField(
                      hintText: 'Correo',
                      controller: _textController.emailController,
                      icon: Icon( Icons.email,
                        color: MyColors.primaryColor,
                      ),
                      textInputType: TextInputType.emailAddress,
                    ),
                CustomTextFieldPassword(
                      hintText: 'Contraseña',
                      controller: _textController.passwordController,
                      icon: Icon( Icons.lock,
                        color: MyColors.primaryColor,
                      ),
                      textInputType: TextInputType.emailAddress,
                    ),
                CustomButton(
                  text: 'Ingresar',
                  onPressed: () => { _textController.login() },
                ),
                _textDontHaveAccount(),
              ],
            ),
          ],
              ),
            ),
        ));
  }

  Widget _circleLogin() {
    return Container(
      width: 240,
      height: 230,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: MyColors.primaryColor),
    );
  }

  Widget _imageBanner() {
    return Container(
      margin: EdgeInsets.only(
          top: 150, bottom: MediaQuery.of(context).size.height * 0.12),
      child: Image.asset(
        "assets/img/delivery.png",
        width: 200,
        height: 200,
      ),
    );
  }

  Widget _animatedImage() {
    return Container(
      margin: EdgeInsets.only(
          top: 50, bottom: MediaQuery.of(context).size.height * 0.01),
      child: Lottie.asset(
        'assets/json/delivery-riding.json',
        width: 300, height: 300, fit: BoxFit.fill,
      ),
    );
  }

  Widget _textDontHaveAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "No tienes cuenta?",
          style: TextStyle(
            color: MyColors.primaryColor,
          ),
        ),
        SizedBox(
          width: 7,
        ),
        GestureDetector(
          child: Text(
            "Registrate",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: MyColors.primaryColor,
            ),
          ),
          onTap: () {
            _textController.goToRegisterPage();
          },
        ),
      ],
    );
  }
}
