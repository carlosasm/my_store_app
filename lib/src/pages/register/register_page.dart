import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:my_store/src/pages/register/register_controller.dart';
import 'package:my_store/src/utils/theme_provider.dart';
import 'package:my_store/src/widgets/custom_buttom.dart';
import 'package:my_store/src/widgets/custom_textfield.dart';
import 'package:my_store/src/widgets/custom_textfield_password.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  RegisterController _registerController = new RegisterController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {
      _registerController.init(context);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _registerController.onDispose(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            width: double.infinity,
            child: Stack(children: [
              Positioned(
                top: -80,
                left: -100,
                child: _circleLogin(),
              ),
              Positioned(
                top: 65,
                left: 27,
                child: _textRegister(),
              ),
              Positioned(
                top: 52,
                left: -5,
                child: _iconBack(),
              ),
              Container(
                margin: EdgeInsets.only(top: 150),
                width: double.infinity, //Centrar
                child: Column(
                  children: [
                    _userImage(),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                      hintText: 'Correo',
                      controller: _registerController.emailController,
                      icon: Icon( Icons.email,
                        color: MyColors.primaryColor,
                      ),
                      textInputType: TextInputType.emailAddress,
                    ),
                    CustomTextField(
                      hintText: 'Nombre',
                      controller: _registerController.nameController,
                      icon: Icon( Icons.person,
                        color: MyColors.primaryColor,
                      ),
                      textInputType: TextInputType.text,
                    ),
                    CustomTextField(
                      hintText: 'Apellidos',
                      controller: _registerController.lastNameController,
                      icon: Icon( Icons.person_outline,
                        color: MyColors.primaryColor,
                      ),
                      textInputType: TextInputType.text,
                    ),
                    CustomTextField(
                      hintText: 'Teléfono',
                      controller: _registerController.phoneController,
                      icon: Icon( Icons.phone,
                        color: MyColors.primaryColor,
                      ),
                      textInputType: TextInputType.phone,
                    ),
                    CustomTextFieldPassword(
                      hintText: 'Contraseña',
                      controller: _registerController.passwordController,
                      icon: Icon( Icons.password,
                        color: MyColors.primaryColor,
                      ),
                      textInputType: TextInputType.visiblePassword,
                    ),
                    CustomTextFieldPassword(
                      hintText: 'Confirmar contraseña',
                      controller: _registerController.confirmPasswordController,
                      icon: Icon( Icons.lock_open_outlined,
                        color: MyColors.primaryColor,
                      ),
                      textInputType: TextInputType.visiblePassword,
                    ),
                    CustomButton(
                      text: 'Registrarse',
                     onPressed: () => { _registerController.register() },
                    ),
                  ],
                ),
              ),
            ])),
      ),
    );
  }

  Widget _userImage() {
    return CircleAvatar(
      backgroundImage: AssetImage('assets/img/user_profile_2.png'),
      radius: 60,
      backgroundColor: Colors.grey[200],
    );
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
}

Widget _iconBack() {
  return IconButton(
    onPressed: () {},
    icon: Icon(Icons.arrow_back_ios),
    color: Colors.white,
  );
}

Widget _textRegister() {
  return Text(
    "Registro",
    style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 20,
        fontFamily: 'NimbusSans'),
  );
}