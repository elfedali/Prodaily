import 'package:flutter/material.dart';
import 'package:prodaily/models/task.dart';
import 'package:prodaily/providers/task_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.taskProvider});

  final TaskProvider taskProvider;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    if(widget.taskProvider.tasks.isEmpty){
      widget.taskProvider.tasks.addAll(
        [
          Task(
            id: 1,
            title: 'Work at home',
            description: 'The quick brown fox jumps over the lazy dog',
            dueDate: '2021-10-10',
            priority: Priority.LOW,
            status: Status.TODO,
          ),
          Task(
            id: 2,
            title: 'Build website',
            description: 'Build a website using wordpress',
            dueDate: '2021-10-10',
            priority: Priority.HIGH,
            status: Status.TODO,
          ),
        ],
      );


    }
    return Scaffold(
      appBar: AppBar(title: const Text('Prodaily'), backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: <Widget>[
          // add
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add',
            onPressed: () {
              Navigator.pushNamed(context, '/add_task');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'More',
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),

        ],
      ),
      body: ListView.builder(
        itemCount: widget.taskProvider.tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text( widget.taskProvider.tasks[index].title, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text( widget.taskProvider.tasks[index].description ),
            trailing: Text( widget.taskProvider.tasks[index].dueDate),
          );
        },
      ),

    );

  }

}
