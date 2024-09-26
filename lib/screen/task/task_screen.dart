import 'package:daily_planner/model/task_model.dart';
import 'package:daily_planner/screen/task/task_function/add_task.dart';
import 'package:daily_planner/screen/task/task_list.dart';
import 'package:flutter/material.dart';
import 'package:daily_planner/utilities/dummy_data.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TaskScreen extends StatefulWidget {
  const TaskScreen({super.key});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  var getDataTask = taskData;
  void _addTask(TaskModel task) {
    setState(() {
      getDataTask.add(task);
    });
  }

  _openAddTaskOverlay() {
    showModalBottomSheet(
      useSafeArea: true,
      isScrollControlled: true,
      context: context,
      builder: (ctx) => AddTaskScreen(onAddTask: _addTask),
    );
  }

  _removeTask(TaskModel taskModel) {
    final taskIndex = getDataTask.indexOf(taskModel);
    setState(() {
      getDataTask.remove(taskModel);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Task Remove'),
        duration: const Duration(seconds: 4),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(() {
                getDataTask.insert(taskIndex, taskModel);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Task List'),
        actions: [
          IconButton(
              onPressed: _openAddTaskOverlay,
              icon: FaIcon(FontAwesomeIcons.plus))
        ],
      ),
      body: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              Expanded(
                  child: TaskList(
                canDismissed: true,
                task: taskData,
                onRemoveTask: _removeTask,
              )),
            ],
          )),
    );
  }
}
