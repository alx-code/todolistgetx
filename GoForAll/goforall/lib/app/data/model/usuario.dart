// To parse this JSON data, do
//
//     final usuario = usuarioFromJson(jsonString);

import 'dart:convert';

Usuario usuarioFromJson(String str) => Usuario.fromJson(json.decode(str));

String usuarioToJson(Usuario data) => json.encode(data.toJson());

class Usuario {

    String? user;
    int? id;
    bool exist = false;
    List<TodoList> todoList;
    
    Usuario({
      this.id,
      this.user,
      required this.exist,
      this.todoList = const []
    });


    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json['id'],
        user: json["user"],
        exist: json["user"] != null ? true : false,
        todoList: List<TodoList>.from(jsonDecode(json["todolist"]).map((x) => TodoList.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user": user,
        "todolist": List<dynamic>.from(todoList.map((x) => x.toJson())),
    };
}

class TodoList {
    TodoList({
      required this.description,
    });

    String description;

    factory TodoList.fromJson(Map<String, dynamic> json) => TodoList(
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "description": description,
    };
}
