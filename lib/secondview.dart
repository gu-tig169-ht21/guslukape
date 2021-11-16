import 'package:flutter/material.dart';
import 'thirdview.dart';

class SecondView extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lägg till projekt'),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_right),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ThirdView()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(hintText: 'Nytt projekt'),
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Icon(Icons.add),
            ),
            Container(
              alignment: Alignment.center,
              child: Text('Lägg till'),
            )
          ],
        ),
      ),
    );
  }
}
