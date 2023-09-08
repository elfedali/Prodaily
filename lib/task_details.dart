import 'package:flutter/material.dart';
import 'package:prodaily/models/task.dart';
import 'package:prodaily/providers/task_provider.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({
    super.key,
    required this.task,
    required this.taskProvider,
  });
  final Task task;
  final TaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(task.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: <Widget>[
          // edit
          IconButton(
            icon: const Icon(Icons.edit),
            tooltip: 'Edit',
            onPressed: () {
              Navigator.pushNamed(context, '/edit_task');
            },
          ),
          // delete
          IconButton(
            icon: const Icon(Icons.delete),
            tooltip: 'Delete',
            onPressed: () {
              taskProvider.deleteTask(task);
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(task.description,
            style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
