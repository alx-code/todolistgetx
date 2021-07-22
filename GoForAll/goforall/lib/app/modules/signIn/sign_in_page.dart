import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goforall/app/modules/home/home_controller.dart';

import 'package:goforall/app/modules/signIn/sign_in_controller.dart';

import 'package:goforall/app/global_widgets/button_white.dart';
import 'package:goforall/app/global_widgets/gradient_back.dart';
import 'package:goforall/app/global_widgets/text_inputp.dart';

class SignInPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _SignInScreen();
  }

}

class _SignInScreen extends State<SignInPage> with TickerProviderStateMixin {
  final _controllerUser = TextEditingController();
  final _controllerPass = TextEditingController();
  final _signInCtrl = Get.put(SignInController());

  @override
  Widget build(BuildContext context) {
    final title = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Go 4 All",
            style: TextStyle(
              fontSize: 24,
              fontFamily: "RalewayBold",
              color: Colors.white,
              fontWeight: FontWeight.w300
            ), 
          ),
        ],
    );
    final littleFooterTitle = Container(
          padding: EdgeInsets.only(
            top:10,
            bottom: 10
          ),
          child: Text(
            "Una app de UltraLux",
            style: TextStyle(
              fontSize: 13,
              fontFamily: "Raleway",
              color: Colors.white,
            ), 
          )
    );
    final version = Container(
          padding: EdgeInsets.only(
            top:10,
            bottom: 40
          ),
          child: Text(
            "v1.0.0",
            style: TextStyle(
              fontSize: 13,
              fontFamily: "Raleway",
              color: Colors.white,
            ), 
          )
    );
    final user = Container(
        child: TextInputP(
          hintText: "Correo electrónico",
          inputType: TextInputType.emailAddress,
          controller: _controllerUser,
          isPassword: false, 
          iconData: Icons.text_snippet_rounded,
        )
      );
    final pass = Container(
        child: TextInputP(
          hintText: "Contraseña",
          inputType: TextInputType.text,
          controller: _controllerPass,
          isPassword: true, 
          iconData: Icons.password,
        )
      );
    final buttonLogIn = Container(
      margin: EdgeInsets.only(
        top: 10
      ),
      child: ButtonWhite(
        width: 100,
        height: 40,
        buttonText: "Entrar", 
        onPressed: () async {
          var usuario = await _signInCtrl.SignIn(_controllerUser.value.text, _controllerPass.value.text);
          if(usuario.exist){
            final homeCtrl = Get.put(HomeController());
            homeCtrl.createUser(usuario);
            Get.toNamed('home');
          }
        },
      )
    );
    final content = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        title,
      ],
    );
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          GradientBack(
            colorPrincipal: Color.fromRGBO(37, 69, 184, 72),
            colorSecundary: Color.fromRGBO(54, 65, 107, 42),
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title,
              SizedBox(height: 40),
              user,
              SizedBox(height: 10),
              pass,
              SizedBox(height: 40),
              buttonLogIn,
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              littleFooterTitle,
              version
            ],
          )
        ],
      ),
    );
  }
}