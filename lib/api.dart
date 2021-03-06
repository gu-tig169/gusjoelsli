import 'TodoObject.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const API_URL = 'https://todoapp-api-vldfm.ondigitalocean.app';
const API_KEY = '1f18fdda-a8d6-4e0b-ba28-02ac1ba7bff5';

class Api {
  static Future addNotes(Todo note) async {
    print('lägg till todo');
    var json = jsonEncode(Todo.toJson(note));
    await http.post(
      '$API_URL/todos?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
    print('Tillagd');
  }

static Future <List<Todo>> getNotes() async {
  var response = await http.get('$API_URL/todos?key=$API_KEY');
  print(response.body);
  var json = jsonDecode(response.body);
  print(json);
  return json.map<Todo>((data) {
    return Todo.fromJson(data);
  }).toList();
}

  static Future removeNote(String noteId) async {
    print('remove todo');
    await http.delete('$API_URL/todos/$noteId?key=$API_KEY');
    print('todo removed');
  }

  static Future changeStatus(Todo note) async {
    String noteID = note.id;
    var json = jsonEncode(Todo.toJson(note));
    print('changeStatus: id=$noteID, body=$json');
    await http.put(
      '$API_URL/todos/$noteID?key=$API_KEY',
      body: json,
      headers: {'Content-Type': 'application/json'},
    );
    print('changed status');
  }
}