import 'package:intl/intl.dart';

enum Priority {
  LOW,
  MEDIUM,
  HIGH,
}

enum Status {
  TODO,
  IN_PROGRESS,
  DONE,
}

class Task {
  final int id;
  String title;
  String description;
  String createdAt;
  Priority priority;
  Status status;

  Task({
    required this.id,
    required this.title,
    required this.description,
    String? createdAt,
    this.priority = Priority.LOW,
    this.status = Status.TODO,
  }) : createdAt = createdAt ??
            DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
}
