import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'EditTodoView.dart';
import 'TodoList.dart';
import 'TodoObject.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: Center(
      child:Consumer<MyState>
      (builder: (context, state, child) => TodoList(_filterTodo(state.todo, state.standardOption)),),
      ),
      floatingActionButton: _editTodoButton(context), 
    );  
  }
}

Widget _appBar(context) {
  return AppBar(
    backgroundColor: Colors.amber,   
      title: Text('Min ToDo', 
      style: TextStyle(
        color: Colors.white, 
        fontSize: 24.0)), 
        actions: [
          _popupMenu(context),
        ],
  );
}

final List<String> options = ['All', 'Done', 'Undone'];

  Widget _popupMenu(context) {
    return PopupMenuButton<String>(
      onSelected: (value) {
        Provider.of<MyState>(context, listen: false).setFilterBy(value);
      },
      itemBuilder: (BuildContext context) {
        return options.map((options) =>
          PopupMenuItem(value: options, child: Text(options))).toList();
      },
      icon: Icon(
        Icons.more_vert,
          color: Colors.white,
          size: 30,
      ),
    );
  }
  
  List<Todo> _filterTodo(todo, options) {
    if (options == "Done") {
      return todo.where((note) => note.done == true).toList();
    } 
    else if (options == "Undone") {
      return todo.where((note) => !note.done).toList();
    }
    return todo;
  }

  Widget _editTodoButton(BuildContext context) {
    return FloatingActionButton( 
      onPressed: () async { 
        var newNote = await Navigator.push(context,
          MaterialPageRoute(builder: (context) => EditTodoView(
          Todo(message: 'default'))));
          if (newNote != null ) { 
            Provider.of<MyState>(context, listen: false).addNote(newNote);
          }
        }, 
        child: Icon(Icons.add, size: 50.0), 
        backgroundColor: Colors.amber);
  }
