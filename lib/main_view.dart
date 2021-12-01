import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'tasks_list.dart';
import 'add_new_task_view.dart';
import 'model.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('TIG169: Att göra'),
        actions: [
          PopupMenuButton(
              onSelected: (int value) {
                Provider.of<MyState>(context, listen: false).setFilterBy(value);
              },
              color: Colors.blueGrey[200],
              elevation: 40,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black, width: 2),
              ),
              itemBuilder: (context) => [
                    const PopupMenuItem(
                        child: Text('Alla uppgifter'), value: 1),
                    const PopupMenuItem(
                        child: Text('Färdiga uppgifter'), value: 2),
                    const PopupMenuItem(
                        child: Text('Ofärdiga uppgifter'), value: 3)
                  ]),
        ],
      ),
      body: Consumer<MyState>(
        builder: (context, state, child) =>
            TasksList(_filterList(state.list, state.filterBy)),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          var newItem = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      AddNewTaskView(NewTask(message: '', id: ''))));
          if (newItem != null) {
            Provider.of<MyState>(context, listen: false).addingTask(newItem);
          }
        },
      ),
    );
  }

  List<NewTask> _filterList(list, value) {
    if (value == 1) return list;
    if (value == 2) {
      return list.where((task) => task.isCompleted == true).toList();
    } else if (value == 3) {
      return list.where((task) => task.isCompleted == false).toList();
    }

    return list;
  }
}
