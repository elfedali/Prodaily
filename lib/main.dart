import 'package:flutter/material.dart';
import 'package:prodaily/count_down.dart';
import 'package:prodaily/home.dart';
import 'package:prodaily/new_task.dart';
import 'package:prodaily/providers/task_provider.dart';
import 'package:prodaily/settings.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TaskProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context);
    return MaterialApp(
        title: 'Prodaily',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => Home(taskProvider: taskProvider),
          '/count_down': (context) => const CountDown(),
          '/settings': (context) => const Settings(),
          '/add_task': (context) => AddTaskScreen(taskProvider: taskProvider),
        });
  }
}
