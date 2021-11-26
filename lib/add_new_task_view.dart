import 'package:flutter/material.dart';
import './model.dart';

class AddNewTaskView extends StatefulWidget {
  final NewTask message;
  AddNewTaskView(this.message);

  @override
  State<StatefulWidget> createState() {
    return AddNewTaskViewState(message);
  }
}

class AddNewTaskViewState extends State<AddNewTaskView> {
  String message = 'message';
  TextEditingController textEditingController = TextEditingController();

  AddNewTaskViewState(NewTask task) {
    this.message = task.message;

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
              Navigator.pop(context, NewTask(message: message, id: ''));
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
