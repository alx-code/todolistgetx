

import 'package:get/get.dart';
import 'package:goforall/app/data/model/usuario.dart';
import 'package:goforall/app/data/repository/respositoy.dart';

class HomeController extends GetxController{
  final Repository _repository = Repository();
  Rx<Usuario> usuario = new Usuario(exist: false).obs;
  
  HomeController(){

  }
  
  Future<void> addToDo (String todo) async {
    this.usuario.update((val) {
      val!.todoList = [ ...val.todoList, TodoList(description: todo)];
    });
    await _repository.add(usuario.value);
  }
  Future<void> removeToDo () async {
    await _repository.add(usuario.value);
  }
  void createUser(Usuario usuario) {
    this.usuario.value = usuario;
  }
}