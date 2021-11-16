import 'package:flutter/material.dart';

class ThirdView extends StatelessWidget {
  Widget build(BuildContext context) {
    int _counter = 1;
    return StatefulBuilder(
      builder: (context, setState) => Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Text('$_counter', style: TextStyle(fontSize: 36)),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _counter = _counter + 1;
            });
          },
        ),
      ),
    );
  }
}
