import 'package:flutter/material.dart';
import 'package:prodaily/components/empty_state.dart';
import 'package:prodaily/models/task.dart';
import 'package:prodaily/providers/task_provider.dart';
import 'package:prodaily/task_details.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.taskProvider});

  final TaskProvider taskProvider;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var appBar2 = AppBar(
      title: const Text('Prodaily'),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
    );
    return Scaffold(
      appBar: appBar2,
      body: widget.taskProvider.tasks.isEmpty
          ? const EmptyState()
          : RefreshIndicator(
              onRefresh: () async {
                await Future.delayed(const Duration(seconds: 1));
                setState(() {});
              },
              child: ListView.builder(
                itemCount: widget.taskProvider.tasks.length,
                itemBuilder: (BuildContext context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) => widget.taskProvider
                        .deleteTask(widget.taskProvider.tasks[index]),
                    direction: DismissDirection.endToStart,
                    background: Container(
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20.0),
                      color: Theme.of(context).colorScheme.error,
                      child: const Icon(Icons.delete, color: Colors.white),
                    ),
                    child: TodoListItem(
                        task: widget.taskProvider.tasks[index],
                        taskProvider: widget.taskProvider),
                  );
                },
              ),
            ),
    );
  }
}

// todo list view item
class TodoListItem extends StatelessWidget {
  const TodoListItem(
      {super.key, required this.task, required this.taskProvider});

  final Task task;
  final TaskProvider taskProvider;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // navigate to details page with task details, not in routes
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TaskDetails(task: task, taskProvider: taskProvider),
          ),
        );
      },
      child: ListTile(
        title: Text(task.title,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(task.description),
        trailing: Text(task.createdAt),
      ),
    );
  }
}
