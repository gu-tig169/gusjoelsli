import 'package:flutter/material.dart';

import './TodoObject.dart';

class EditTodoView extends StatefulWidget {
  final Todo note;

  EditTodoView(this.note);

  @override
  State<StatefulWidget> createState() {
    return EditTodoViewState();
  }
}

class EditTodoViewState extends State<EditTodoView> {
  String message;
  bool textFieldEmpty = false;
  TextEditingController textEditingController;

  EditTodoViewState() {
    this.message = message;
    textEditingController = TextEditingController(text: message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.amber, 
        title: Text('Skapa ToDo', style: TextStyle(color: Colors.white, fontSize: 24.0)), 
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Container(
            height: 50.0), 
             _sizedBox(),
            _flatButton(),
          ], 
        ),
      ), 
    );
  }

    Widget _sizedBox() {
    return SizedBox( 
      width: 300,
      child: TextField(
        controller: textEditingController,
        textAlign: TextAlign.center, 
        decoration: InputDecoration(
        border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber)),
        hintText: 'What are you going to do?',
        errorText: textFieldEmpty ? 'Dont leave the field empty' : null,
       ), 
      ),
    ); 
  }

    Widget _flatButton() {
    return FlatButton(
      onPressed: () {
        setState(() {
          if (textEditingController.text.isEmpty) {
            textFieldEmpty = true; 
          } else {
            Navigator.pop(context, Todo(message: message));
          }
        });
      },
      child: Text( 
      '+ADD',
      ),
    );
  }   
} 



