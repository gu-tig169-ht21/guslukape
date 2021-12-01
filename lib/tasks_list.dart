import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class TasksList extends StatelessWidget {
  final List<NewTask> list;

  const TasksList(this.list, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        children:
            list.map((NewTask task) => _taskItem(context, task)).toList());
  }

  Widget _taskItem(context, NewTask task) {
    var state = Provider.of<MyState>(context, listen: false);
    return Container(
      margin: const EdgeInsets.all(3),
      padding: const EdgeInsets.only(),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blueGrey),
          borderRadius: const BorderRadius.all(Radius.circular(50))),
      child: CheckboxListTile(
        title: Text(
          task.message,
          style: (TextStyle(
            fontSize: 20,
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            decorationThickness: 1,
          )),
        ),
        secondary: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            state.removeTask(task);
          },
        ),
        controlAffinity: ListTileControlAffinity.leading,
        value: task.isCompleted,
        onChanged: (value) {
          state.updatingTask(task);
        },
        activeColor: Colors.blueGrey[200],
        checkColor: Colors.greenAccent[400],
      ),
    );
  }
}
