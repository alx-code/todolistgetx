import 'package:get/get.dart';
import 'package:goforall/app/data/model/usuario.dart';

import 'package:goforall/app/data/repository/respositoy.dart';

class SignInController extends GetxController{
  final Repository _repository = Repository();


  Future<Usuario> SignIn(String user, String password) async => await _repository.login(user, password);


}