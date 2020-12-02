import 'package:flutter/material.dart';
import 'api.dart';

class Todo {
  String id;
  String message;
  bool done;
  
  Todo({this.id, this.message, this.done = false});

  static Map<String, dynamic> toJson(Todo note) {
    return {
      'title': note.message,
      'done': note.done,
    };
  }

  void checkboxValue() {
    this.done =! this.done;
  }

  static Todo fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      message: json['title'],
      done: json['done'] == null ? false : json['done'],
    );
  }
}

class MyState extends ChangeNotifier {
  List<Todo> _todo = [];
  List<Todo> get todo => _todo;
  
  String _standardOption = 'All';
  String get standardOption => _standardOption;

  Future getList() async {
    List<Todo> todo = await Api.getNotes();
    _todo = todo;
    notifyListeners();
  }

  void addNote(Todo note) async {
    await Api.addNotes(note);
    await getList();
  }

  void removeNote(Todo note) async {
    await Api.removeNote(note.id);
    await getList();
  }

  void changeCheckboxValue(Todo note, bool getValue) async{
    note.done = getValue;
    await Api.changeStatus(note);
    notifyListeners();
  }

  void setFilterBy(String standardOption) {
    this._standardOption = standardOption;
    notifyListeners();
  }
  
  
}