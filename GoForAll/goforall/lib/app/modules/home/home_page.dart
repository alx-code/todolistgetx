import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:goforall/app/data/model/usuario.dart';
import 'package:goforall/app/modules/home/home_controller.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _textFieldController = TextEditingController();

  final homeCtrl = Get.put(HomeController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go4All List'),
        
      ),
      body: ListView(children: _getItems()),
      // add items to the to-do list
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(37, 69, 184, 72),
          onPressed: () => _displayDialog(context),
          tooltip: 'Add Item',
          child: Icon(Icons.add)),
    );
  }

  void _addTodoItem(String title) {
    homeCtrl.addToDo(title);
    setState(() {
    });
    _textFieldController.clear();
  }
  void _removeTodoItem() {
    homeCtrl.removeToDo();
    setState(() {
    });
  }
  Widget _buildTodoItem(String title, int index) {
    return ListTile(
      title: Text(title),
      onTap: () {
        _deleteTodo(index);
      }
    );
  }

  _displayDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          title: const Text('Add a task to your list'),
          content: TextField(
            controller: _textFieldController,
            decoration: const InputDecoration(hintText: 'Enter task here'),
          ),
          actions: <Widget>[
            FlatButton(
              child: const Text('ADD'),
              onPressed: () {
                Navigator.of(context).pop();
                _addTodoItem(_textFieldController.text);
              },
            ),
            FlatButton(
              child: const Text('CANCEL'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  } 
  List<Widget> _getItems() {
    final List<Widget> _todoWidgets = <Widget>[];
    homeCtrl.usuario.value.todoList.asMap().forEach((index, value) {
      _todoWidgets.add(_buildTodoItem(value.description, index));

    });
    return _todoWidgets;
  }

  _deleteTodo(int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
          title: const Text('¿Eliminaras esta tarjeta estas de acuerdo?'),
          actions: <Widget>[
            FlatButton(
              child: const Text('Sí'),
              onPressed: () {
                homeCtrl.usuario.value.todoList.removeAt(index);
                _removeTodoItem();
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: const Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ));
  }
}