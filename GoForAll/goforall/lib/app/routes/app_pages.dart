import 'package:get/route_manager.dart';

import 'package:goforall/app/routes/app_routes.dart';

import 'package:goforall/app/modules/signIn/sign_in_page.dart';

class AppPages{
  static final List<GetPage> pages = [
    GetPage(name: AppRoutes.SIGNINSCREEN, page: () => SignInPage())
  ];
}