import 'package:flutter/material.dart';

class EmptyState extends StatelessWidget {
  const EmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Empty list', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
