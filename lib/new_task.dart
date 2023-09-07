import 'package:flutter/material.dart';
import 'package:prodaily/models/task.dart';
import 'package:prodaily/providers/task_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key, required this.taskProvider});

  final TaskProvider taskProvider;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dueDateController = TextEditingController();
  Priority _selectedPriority = Priority.LOW;
  Status _selectedStatus = Status.TODO;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New',
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // save action

        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            tooltip: 'Save',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Create a new task
                final newTask = Task(
                  id: widget.taskProvider.tasks.length +
                      1, // Generate a unique ID
                  title: _titleController.text,
                  description: _descriptionController.text,
                  dueDate: _dueDateController.text,
                  priority: _selectedPriority,
                  status: Status.TODO,
                );

                // Add the new task to the taskProvider
                widget.taskProvider.addInfirst(newTask);

                // Navigate back to the previous screen
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  autofocus: true,
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                //Long text field
                TextFormField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _dueDateController,
                  decoration: const InputDecoration(labelText: 'Due Date'),
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<Priority>(
                  value: _selectedPriority,
                  items: Priority.values.map((priority) {
                    return DropdownMenuItem<Priority>(
                      value: priority,
                      child: Text(priority.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedPriority = value!;
                    });
                  },
                ),
                /*    DropdownButtonFormField<Status>(
                  value: _selectedStatus,
                  items: Status.values.map((status) {
                    return DropdownMenuItem<Status>(
                      value: status,
                      child: Text(status.toString()),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedStatus = value!;
                    });
                  },
                ), */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
