import 'package:http/http.dart' as http;
import 'model.dart';
import 'dart:convert';

const API_KEY = "2cd9671f-e82d-47a8-8d16-a2f440b251dc";
const API_URL = "https://todoapp-api-pyq5q.ondigitalocean.app";

class ApiFetcher {
  static Future<List<NewTask>> addTask(NewTask task) async {
    Map<String, dynamic> json = NewTask.toJson(task);
    var bodyString = jsonEncode(json);
    var response = await http.post(
      Uri.parse('$API_URL/todos?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);
    return list.map<NewTask>((data) {
      return NewTask.fromJson(data);
    }).toList();
  }

  static Future deleteTask(String taskID) async {
    var response =
        await http.delete(Uri.parse('$API_URL/todos/$taskID?key=$API_KEY'));
    var bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<NewTask>((data) {
      return NewTask.fromJson(data);
    }).toList();
  }

  static Future updateTask(String taskID, NewTask task) async {
    Map<String, dynamic> json = NewTask.toJson(task);
    var bodyString = jsonEncode(json);
    var response = await http.put(
      Uri.parse('$API_URL/todos/$taskID?key=$API_KEY'),
      body: bodyString,
      headers: {'Content-Type': 'application/json'},
    );
    bodyString = response.body;
    var list = jsonDecode(bodyString);

    return list.map<NewTask>((data) {
      return NewTask.fromJson(data);
    }).toList();
  }

  static Future<List<NewTask>> gettingTasks() async {
    http.Response response =
        await http.get(Uri.parse('$API_URL/todos?key=$API_KEY'));
    var kollakollaAtt = response.body;
    var json = jsonDecode(kollakollaAtt);
    return json.map<NewTask>((data) {
      return NewTask.fromJson(data);
    }).toList();
  }
}
