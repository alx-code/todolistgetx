

import 'package:goforall/app/data/model/usuario.dart';
import 'package:goforall/app/data/services/services.dart';

class Repository{
  final _services = Services();


  Future<Usuario> login(String user, String password) => _services.login(user, password);

  Future<void> add(Usuario usuario) => _services.add(usuario);

}