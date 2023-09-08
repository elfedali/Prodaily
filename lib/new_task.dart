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

  final TextEditingController _descriptionController = TextEditingController();
  TextStyle _currentTextStyle = const TextStyle();
  @override
  void initState() {
    super.initState();
    _descriptionController.addListener(_updateTextStyle);
  }

  void _updateTextStyle() {
    setState(() {
      _currentTextStyle = (_descriptionController.text.length > 160
          ? Theme.of(context).textTheme.bodyLarge
          : Theme.of(context).textTheme.titleLarge)!;
    });
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'New',
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        // save action

        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            tooltip: 'Save',
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Create a new task
                final newTask = Task(
                  id: DateTime.now().millisecondsSinceEpoch,
                  title: 'Untitled',
                  description: _descriptionController.text,
                  status: Status.TODO,
                );
                widget.taskProvider.addInfirst(newTask);
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                // I want this to be full height of the screen,
                controller: _descriptionController,
                autofocus: true,
                style:
                    _currentTextStyle, // displaySmall or bodyLarge based on the text size you I want
                decoration: const InputDecoration(
                  labelText: 'Description',
                  //hintText: 'Enter your description',
                  contentPadding: EdgeInsets.all(8),
                  border: InputBorder.none,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
