import 'package:flutter/material.dart';
import 'secondview.dart';

void main() {
  runApp(LukasApp());
}

class LukasApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}

class MainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('TIG169: Att göra'),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text("All"),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text("Done"),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text("Undone"),
                      value: 3,
                    )
                  ])
        ],
      ),
      body: _list(),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => SecondView()));
          }),
    );
  }

  Widget _list() {
    var assignment = [
      "Gör gröt",
      "Läxa",
      "Tänka",
      "Leka",
      "Träna",
      "Sova",
      "Jobba",
    ];
    return ListView.builder(
        itemCount: assignment.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              _listItems(assignment[index]),
              Divider(
                thickness: 2,
              ),
            ],
          );
        });
  }

  Widget _listItems(assignmentTitle) {
    return ListTile(
      leading: MyCB(),
      title: Text(
        assignmentTitle,
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {},
      ),
    );
  }

  Widget _checkBoxAlt(String assignment) {
    return Row(children: [
      MyCB(),
      Container(
        height: 30,
        width: 250,
        child: Text(
          assignment,
          style: const TextStyle(
            fontSize: 25,
          ),
        ),
      ),
      IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {},
      )
    ]);
  }
}

class MyCB extends StatefulWidget {
  @override
  State<MyCB> createState() => _MyCBState();
}

class _MyCBState extends State<MyCB> {
  bool? _myBool = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
        value: _myBool,
        onChanged: (value) {
          setState(() {
            _myBool = value;
          });
        });
  }
}
