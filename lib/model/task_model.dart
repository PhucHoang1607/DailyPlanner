import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatMatter = DateFormat.yMd();

class TaskModel {
  String id;
  String? title;
  // DateTime day;
  String context;
  DateTime timeStart;
  DateTime timeEnd;
  String place;
  String hoster;
  String description;
  Status status;

  TaskModel({
    required this.title,
    // required this.day,
    required this.context,
    required this.timeStart,
    required this.timeEnd,
    required this.place,
    required this.hoster,
    required this.description,
    required this.status,
  }) : id = uuid.v4();

  get formattedStartMDY {
    return formatMatter.format(timeStart);
  }

  get formattedEndMDY {
    return formatMatter.format(timeEnd);
  }
}

enum Status { created, process, excellent, done }

const statusIcon = {
  Status.created: {
    'icon': FontAwesomeIcons.squarePlus,
    'color': Colors.red,
  },
  Status.process: {
    'icon': FontAwesomeIcons.ellipsis,
    'color': Colors.purpleAccent,
  },
  Status.excellent: {
    'icon': FontAwesomeIcons.crown,
    'color': Colors.yellow,
  },
  Status.done: {
    'icon': FontAwesomeIcons.checkDouble,
    'color': Colors.green,
  },
};

class TaskChartCount {
  final Status status;
  final List<TaskModel> tasks;
  const TaskChartCount({required this.status, required this.tasks});

  TaskChartCount.forCountStatus(List<TaskModel> allTask, this.status)
      : tasks = allTask.where((task) => task.status == status).toList();

  double get totalStatus {
    double sum = 0;

    for (final task in tasks) {
      sum += 1;
    }
    return sum;
  }
}
