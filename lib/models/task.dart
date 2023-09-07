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

class Task{
  final int id;
  String title;
  String description;
  String dueDate;
  Priority priority;
  Status status;  

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.status,
  });
}


List tasks = [
  Task(
    id: 1,
    title: 'Work',
    description: 'Discipline is the bridge between goals and accomplishment',
    dueDate: '2021-10-10',
    priority: Priority.LOW,
    status: Status.TODO,
  ),
  Task(
    id: 2,
    title: 'Build Flutter App',
    description: 'The time has come to build a Flutter app',
    dueDate: '2021-10-10',
    priority: Priority.MEDIUM,
    status: Status.IN_PROGRESS,
  ),
  Task(
    id: 3,
    title: 'Develop in Laravel',
    description: 'Time to develop in Laravel',
    dueDate: '2021-10-10',
    priority: Priority.HIGH,
    status: Status.DONE,
  ),
  Task(
    id: 4,
    title: 'Javascript',
    description: 'Learn Javascript, React, Vue, Angular, discover new frameworks',
    dueDate: '2021-10-10',
    priority: Priority.LOW,
    status: Status.TODO,
  ),

  Task(
    id: 5,
    title: 'Javascript',
    description: 'Learn Javascript, React, Vue, Angular, discover new frameworks',
    dueDate: '2021-10-10',
    priority: Priority.LOW,
    status: Status.TODO,
  ),


  Task(
    id: 6,
    title: 'Javascript',
    description: 'Learn Javascript, React, Vue, Angular, discover new frameworks',
    dueDate: '2021-10-10',
    priority: Priority.LOW,
    status: Status.TODO,
  ),



  Task(
    id: 7,
    title: 'Javascript',
    description: 'Learn Javascript, React, Vue, Angular, discover new frameworks',
    dueDate: '2021-10-10',
    priority: Priority.LOW,
    status: Status.TODO,
  ),

  Task(
    id: 8,
    title: 'Design',
    description: 'Learn design, Figma, Adobe XD, Photoshop, Illustrator, discover new frameworks',
    dueDate: '2021-10-10',
    priority: Priority.LOW,
    status: Status.TODO,
  ),

  Task(
    id: 9,
    title: 'Terminal',
    description: 'Learn terminal, Linux, Ubuntu, discover new frameworks',
    dueDate: '2021-10-10',
    priority: Priority.LOW,
    status: Status.TODO,
  ),

  Task(
    id: 10,
    title: 'Shared Hosting',
    description: 'Learn shared hosting, cPanel, discover new frameworks',
    dueDate: '2021-10-10',
    priority: Priority.LOW,
    status: Status.TODO,
  ),
];

