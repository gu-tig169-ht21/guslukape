import 'package:flutter/material.dart';
import './model.dart';

class AddNewTaskView extends StatefulWidget {
  final NewTask task;

  AddNewTaskView(this.task);

  @override
  State<StatefulWidget> createState() {
    return AddNewTaskViewState(task);
  }
}

class AddNewTaskViewState extends State<AddNewTaskView> {
  late String message;

  late TextEditingController textEditingController;

  AddNewTaskViewState(NewTask task) {
    this.message = task.message;

    textEditingController = TextEditingController(text: task.message);

    textEditingController.addListener(() {
      setState(() {
        message = textEditingController.text;
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Lägg till nytt todo'), actions: [
          FlatButton(
            child: Text('Spara', style: TextStyle(color: Colors.white)),
            onPressed: () {
              Navigator.pop(context, NewTask(message: message));
            },
          )
        ]),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(height: 20),
              TextField(
                textAlign: TextAlign.center,
                controller: textEditingController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    fillColor: Colors.blueGrey,
                    hintText: 'Vad ska vi göra nu?',
                    hintStyle: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white,
                        fontWeight: FontWeight.bold)),
              ),
              //NewTaskPreview(NewTask(message: this.message)),
            ])));
  }
}
