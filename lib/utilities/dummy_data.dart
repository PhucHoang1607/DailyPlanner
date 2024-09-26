import 'package:daily_planner/model/task_model.dart';

final List<TaskModel> _listTaskPlanner = [
  TaskModel(
    title: "Intern Test",
    // day: DateTime(2024, 9, 24),
    context: "Make an app to past the test with some requirement",
    timeStart: DateTime(2024, 9, 24, 6, 0),
    timeEnd: DateTime(2024, 9, 28, 12, 0),
    place: 'At home',
    hoster: 'Thanh Ngan, Huu Nghia',
    description: 'Do some test for the intern ',
    status: Status.created,
  ),
  TaskModel(
    title: "Learn new Technology",
    // day: DateTime(2024, 9, 15),
    context: "Have some basic homework about the new technology",
    timeStart: DateTime(2024, 9, 15, 6, 0),
    timeEnd: DateTime(2024, 9, 22, 12, 0),
    place: 'At home',
    hoster: 'Hoang Phuc',
    description: 'Learn Something new',
    status: Status.done,
  ),
  TaskModel(
    title: "Delivery",
    // day: DateTime(2024, 9, 15),
    context: "Delivery the package to the customer",
    timeStart: DateTime(2024, 9, 25, 6, 0),
    timeEnd: DateTime(2024, 9, 26, 6, 0),
    place: 'At customer house',
    hoster: 'Hoang Phuc',
    description: 'Carefull with the package',
    status: Status.process,
  ),
  TaskModel(
    title: "Repaint the wall",
    // day: DateTime(2024, 9, 15),
    context: "Repaint the wall, clean the house and move some furniture",
    timeStart: DateTime(2024, 9, 25, 6, 0),
    timeEnd: DateTime(2024, 10, 05, 6, 0),
    place: 'At homne',
    hoster: 'Hoang Phuc',
    description: 'The more carefull the more i can finish',
    status: Status.process,
  ),
];

List<TaskModel> get taskData => _listTaskPlanner;
