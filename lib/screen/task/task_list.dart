import 'package:daily_planner/model/task_model.dart';
import 'package:daily_planner/screen/task/display_task_component.dart';
import 'package:daily_planner/utilities/dummy_data.dart';
import 'package:flutter/material.dart';

class TaskList extends StatelessWidget {
  const TaskList(
      {super.key,
      required this.task,
      required this.onRemoveTask,
      required this.canDismissed});
  final void Function(TaskModel taskModel) onRemoveTask;
  final List<TaskModel> task;
  final bool canDismissed;

  @override
  Widget build(BuildContext context) {
    return canDismissed
        ? ListView.builder(
            itemCount: task.length,
            itemBuilder: (ctx, index) {
              return Dismissible(
                key: ValueKey(task[index]),
                background: Container(
                  color: Theme.of(context).colorScheme.error.withOpacity(0.5),
                  margin: EdgeInsets.symmetric(
                    horizontal: Theme.of(context).cardTheme.margin!.horizontal,
                  ),
                ),
                child: DisplayTaskComponent(
                  task[index],
                ),
                onDismissed: (direction) {
                  onRemoveTask(taskData[index]);
                },
              );
            })
        : ListView.builder(
            itemCount: task.length,
            itemBuilder: (ctx, index) {
              return SingleChildScrollView(
                child: DisplayTaskComponent(
                  task[index],
                ),
              );
            });
  }
}
