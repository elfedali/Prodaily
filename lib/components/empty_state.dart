import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Icon(Icons.abc_outlined, size: 100),
          const SizedBox(height: 20),
          const Text('No tasks yet'),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/add_task');
            },
            child: const Text('Add Task'),
          ),
        ],
      ),
    );
  }
}
