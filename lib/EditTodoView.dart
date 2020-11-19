import 'package:flutter/material.dart';
import './main.dart';
import './TodoObject.dart';

class EditTodoView extends StatelessWidget {
  final Todo note;

  EditTodoView(this.note);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.amber, //ändrar färg på appbaren
        title: Text('Skapa ToDo', style: TextStyle(color: Colors.white, fontSize: 24.0)), //titeln i AppBaren
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          
          Container(
            height: 50.0), //använde container för att flytta ner TextField boxen
          _sizedBox(),
          _flatButton(),
          ], 
        ),
      ), 
    );
  }
} 

  Widget _sizedBox() {
    return SizedBox( 
/*Jag använde SizedBox för att få till storleken på TextField. 
Något jag skulle vilja få till är färgen på borderside och på texten (har kvar koden, men den gör inget).*/ 
      width: 300,
      child: TextField(
        textAlign: TextAlign.center, //sätter texten i mitten
        decoration: InputDecoration(
        border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.amber)), //funkar inte men ska ändra färg på borderside
        hintText: 'What are you going to do?',
        suffixStyle: const TextStyle(color: Colors.amber)), //funkar inte men ska ändra färg på texten
      ),
    ); 
  }

  Widget _flatButton() {
    return FlatButton(
      onPressed: () {},
      child: Text( 
      '+ADD',
      /*Hade från början bara text här, men hittade sen Flatbutton som jag tyckte passade väldigt bra här*/
            
      ),
    );
  }  