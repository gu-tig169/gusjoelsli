import 'package:flutter/material.dart';

class Todo {
  String message;
  Color checkedColor = Colors.amber;
  bool state;

  Todo({
    this.message,
    this.state = false,
    });

  void toggle() {
    state = !state;
  }
}