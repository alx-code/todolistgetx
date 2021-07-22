import 'dart:convert';

import 'package:goforall/app/data/model/usuario.dart';
import 'package:goforall/app/data/services/network_utils.dart';

class Services {

  Future<Usuario> login(String user, String password) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    Map<String, String> body = {
      "User": user,
      "Password": password
    };
    NetworkUtils appApiProvider = NetworkUtils(baseUrl: "http://10.0.2.2:1337", path: "/accessusers/email/$user", headers: headers, body: body);
      return appApiProvider.fetchRequest()
        .then((data){
          return Usuario.fromJson(data);
        });
  } 
  
  Future<void> add(Usuario user) async {
    Map<String, String> headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };
    var todolist = jsonEncode(user.todoList);
    Map<String, String> body = {
      "todolist": todolist,
    };
    NetworkUtils appApiProvider = NetworkUtils(baseUrl: "http://10.0.2.2:1337", path: "/accessusers/${user.id}", headers: headers, body: body);
      return appApiProvider.putRequest()
        .then((data){
          print(data);
        });
  } 

}