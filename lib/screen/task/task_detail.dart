// import 'dart:html';

import 'package:daily_planner/model/task_model.dart';
import 'package:daily_planner/provider/const.dart';
import 'package:daily_planner/screen/task/task_function/edit_task.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  const TaskDetail({super.key, required this.id, required this.taskModel});

  final String id;
  final TaskModel taskModel;

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    final int year = widget.taskModel.timeStart.year;
    final int monthStart = widget.taskModel.timeStart.month;
    final int dayStart = widget.taskModel.timeStart.day;

    final int monthEnd = widget.taskModel.timeEnd.month;
    final int dayEnd = widget.taskModel.timeEnd.day;

    _openAddTaskOverlay() {
      showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) => EditTaskScreen(
          id: widget.id,
          taskModel: widget.taskModel,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(widget.taskModel.title!),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            // crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.taskModel.title!,
                    style: styleMedium,
                  ),
                  Icon(
                    statusIcon[widget.taskModel.status]!['icon'] as IconData,
                    color:
                        statusIcon[widget.taskModel.status]!['color'] as Color,
                  ),
                ],
              ),
              Text(
                year.toString(),
                style: styleSmallForText,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Context',
                style: styleSmall,
              ),
              Text(
                widget.taskModel.context,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    border: Border.all(width: 2, color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '$dayStart/$monthStart',
                      style: styleSmallForText,
                    ),
                    const Icon(Icons.arrow_forward_sharp),
                    Text(
                      '$dayEnd/$monthEnd',
                      style: styleSmallForText,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Place',
                        style: styleSmall,
                      ),
                      Text(
                        widget.taskModel.place,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Text(
                        'Hoster',
                        style: styleSmall,
                      ),
                      Text(
                        widget.taskModel.hoster,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Description',
                style: styleSmall,
              ),
              Text(
                widget.taskModel.description.isEmpty
                    ? 'No description about this'
                    : widget.taskModel.description,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _openAddTaskOverlay,
                    child: const Text('Edit this task'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Back'),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
