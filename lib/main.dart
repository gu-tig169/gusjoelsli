import 'package:flutter/material.dart';
import './EditTodoView.dart';
import './TodoObject.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     title: 'Flutter Demo',
     theme : ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
     ),
     home: TodoListView(),
    );
  }
}



class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.amber,    //ändrar färg på appbaren
      title: Text('Min ToDo', style: TextStyle(color: Colors.white, fontSize: 24.0)), //titeln i AppBaren
        actions: [
          IconButton(icon: Icon(Icons.more_vert_outlined), //ikonen som kommer användas till popupmenyn sen
          onPressed:() {},
          ),
        ],
      ),
    
      body: TodoList([
          Todo(message: 'To do'),
          Todo(message: 'To do'),
          Todo(message: 'To do'),
      ]),

      floatingActionButton: FloatingActionButton( onPressed: () { //plusknappen
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => EditTodoView(
          Todo(message: 'default'))));}, //skickar dig till todo skapar vyn
          child: Icon(Icons.add, size: 50.0), //ändra storleken på plusikonen
          backgroundColor: Colors.amber), //ändra färg på knappen
    );
  }
}

class TodoList extends StatelessWidget {
  final List<Todo> list;

  TodoList(this.list);

  Widget build(BuildContext context) {
    return ListView(children: list.map((note) => _noteItem(note)).toList());
  }

  Widget _noteItem(note) {
    return ListTile(
      leading: Checkbox(activeColor: Colors.amber, //checkboxen med färgen amber när den är i checkad
              value: true,  
                onChanged: (val) {}),/*CheckboxListTile(
        value: state,  // Initialt icke fylld
        : (val) {
          toggle(() {
            
          });
        },  
      ),*/
       title: Text(note.message));
  }
}




  

          