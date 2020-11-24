import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'TodoObject.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todo;
  TodoList(this.todo);
  

  Widget build(BuildContext context) {
    return ListView(children: 
      todo.map((note) => _noteItem(context, note)).toList());
  }

  Widget _noteItem(context, note) {
    return Card( child: 
       CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        activeColor: Colors.amber,
        title: Text(note.message,
        style: TextStyle(
        decoration: (
          note.completed 
          ? TextDecoration.lineThrough
          : TextDecoration.none),
        ),
        ),
        value: note.completed,
        onChanged: (bool checked) {
          Provider.of<MyState>(context, listen: false).changeCheckboxValue(note); 
        },

      secondary: IconButton(icon: Icon(Icons.close),
        onPressed:() {
          var state = Provider.of<MyState>(context, listen: false);
          state.removeNote(note);
        },
      ),
       ),
    );
  }
}