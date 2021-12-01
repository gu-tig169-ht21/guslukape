import 'package:flutter/material.dart';
import './model.dart';

class AddNewTaskView extends StatefulWidget {
  final NewTask message;
  const AddNewTaskView(this.message);

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
        appBar: AppBar(title: const Text('Lägg till nytt todo'), actions: [
          ElevatedButton(
            child: const Text('Spara', style: TextStyle(color: Colors.white)),
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
                      borderRadius: BorderRadius.circular(50),
                    ),
                    filled: true,
                    contentPadding: EdgeInsets.all(16),
                    hintText: 'Vad ska vi göra nu?',
                    hintStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.bold)),
              ),
            ])));
  }
}
