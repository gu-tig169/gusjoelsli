import 'package:flutter/material.dart';


class Todo {
  String message;
  bool completed;
  bool todoToggle;

  Todo({
    this.message,
    this.completed = false,
    this.todoToggle
  }) : super();

  void checkboxValue() {
    completed =! completed;
  }
}

class MyState extends ChangeNotifier {
  final List<Todo> _todo = [];
  List<Todo> get todo => _todo;

  void addNote(Todo note) {
    _todo.add(note);
    notifyListeners();
  }

  void removeNote(Todo note) {
    _todo.remove(note);
    notifyListeners();
  }
void changeCheckboxValue(Todo todo) {
  final todoIndex = _todo.indexOf(todo);
  _todo[todoIndex].checkboxValue();
    notifyListeners();
}

}