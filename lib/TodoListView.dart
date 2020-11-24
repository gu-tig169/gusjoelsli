import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditTodoView.dart';
import 'TodoList.dart';
import 'TodoObject.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.amber,   
      title: Text('Min ToDo', style: TextStyle(color: Colors.white, fontSize: 24.0)), // Menybar för startview
        actions: [
          IconButton(icon: Icon(Icons.more_vert_outlined), 
          onPressed:() {},
          ),
        ],
      ),
      body: Consumer<MyState>
      (builder: (context, state, child) => TodoList(state.todo),),

      // Plusknapp för att lägga till ny Todo
      floatingActionButton: FloatingActionButton( 
        // Vet att ett meddelande ska komma
        onPressed: () async { 
          var newNote = await Navigator.push( 
          context,
          MaterialPageRoute(builder: (context) => EditTodoView(
          Todo(message: 'default'))));
          if (newNote != null ) { 
            Provider.of<MyState>(context, listen: false).addNote(newNote);
          }
          
        }, 
        child: Icon(Icons.add, size: 50.0), 
        backgroundColor: Colors.amber),
    );  
  }
}

