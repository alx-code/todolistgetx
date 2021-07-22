import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goforall/app/modules/home/home_page.dart';

import 'package:goforall/app/modules/signIn/sign_in_page.dart';
import 'package:goforall/app/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
     return GetMaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
        color: Color.fromRGBO(37, 69, 184, 72),
      )),
      key: _scaffoldkey,
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'signIn',
      routes: {
        'signIn': ( _ ) => SignInPage(),
        'home': ( _ ) => HomePage(),
      },
    );
  }
}
