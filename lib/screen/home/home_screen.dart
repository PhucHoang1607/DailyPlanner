import 'package:daily_planner/model/task_model.dart';
import 'package:daily_planner/widget/chart/chart_task.dart';
import 'package:daily_planner/screen/task/task_list.dart';
import 'package:flutter/material.dart';
import 'package:daily_planner/utilities/dummy_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var instanceData = taskData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
      ),
      body: Column(
        children: [
          ChartTask(taskModel: instanceData),
          Expanded(
            child: TaskList(
              canDismissed: false,
              task: instanceData,
              onRemoveTask: onRemoveTask,
            ),
          )
        ],
      ),
    );
  }

  void onRemoveTask(TaskModel taskModel) {
    setState(() {
      instanceData.remove(taskModel);
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Review"),
          content: const Text('This is just for review, cannot delete'),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Okay'))
          ],
        );
      },
    );
  }
}
